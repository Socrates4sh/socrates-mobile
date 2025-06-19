import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'flutter_flow_util.dart';
import 'flutter_flow_video_player.dart';

const kDefaultAspectRatio = 16 / 9;



Set<VideoPlayerController> _videoPlayers = {};

class CustomFullScreenVideoPlayer extends StatefulWidget {
  const CustomFullScreenVideoPlayer({
    Key? key,
    required this.path,
    this.videoType = VideoType.network,
    this.width,
    this.height,
    this.aspectRatio,
    this.autoPlay = false,
    this.looping = false,
    this.showControls = true,
    this.allowFullScreen = false, // Set to false to prevent fullscreen issues
    this.allowPlaybackSpeedMenu = false,
    this.lazyLoad = false,
    this.pauseOnNavigate = true,
    this.onVideoComplete,
    this.slideNumber,
    this.totalSlides,
    this.title,
    this.onPressedFullScreen,
    this.onControllerCreated,
  }) : super(key: key);

  final String path;
  final VideoType videoType;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final VoidCallback? onVideoComplete;
  final bool autoPlay;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlaybackSpeedMenu;
  final bool lazyLoad;
  final bool pauseOnNavigate;
  final int? slideNumber;
  final int? totalSlides;
  final String? title;
  final void Function()? onPressedFullScreen;
  final Function(VideoPlayerController)? onControllerCreated;

  @override
  State<StatefulWidget> createState() => _CustomFullScreenVideoPlayerState();
}

class _CustomFullScreenVideoPlayerState
    extends State<CustomFullScreenVideoPlayer>
    with AutomaticKeepAliveClientMixin, RouteAware {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _loggedError = false;
  bool _hasCompleted = false;
  bool _isDisposed = false;
  bool _isInitialized = false;
  bool _showControls = false;
  bool _subscribedRoute = false;

  // Timer for hiding controls
  Timer? _hideControlsTimer;
  final GlobalKey _videoKey = GlobalKey();
  double? _videoRenderedWidth;

  // Add this to prevent PageView from disposing the state when scrolling
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted || _isDisposed) return;
      await _initializePlayer(); // This should assign _videoPlayerController
      if (!mounted || _isDisposed) return;
      _videoPlayerController?.addListener(_videoListener);
      if (widget.onControllerCreated != null &&
          _videoPlayerController != null) {
        widget.onControllerCreated!(_videoPlayerController!);
      }

      setState(() {}); // Ensure UI updates after controller is ready
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.pauseOnNavigate && ModalRoute.of(context) is PageRoute) {
      _subscribedRoute = true;
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    }
  }

  @override
  void didPushNext() {
    if (widget.pauseOnNavigate) {
      _videoPlayerController?.pause();
    }
  }

  @override
  void dispose() {
    if (_subscribedRoute) {
      routeObserver.unsubscribe(this);
    }
    _isDisposed = true;
    _videoPlayerController?.removeListener(_videoListener);
    _videoPlayerController?.dispose();
    _hideControlsTimer?.cancel();
    _cleanupPlayer();
    super.dispose();
  }

  @override
  void didPopNext() {
    // This route is visible again → maybe resume video
    if (widget.autoPlay) {
      _videoPlayerController?.play();
    }
  }

  void _cleanupPlayer() {
    try {
      if (_videoPlayerController != null) {
        _videoPlayers.remove(_videoPlayerController);
      }

      if (_chewieController != null) {
        _chewieController!.removeListener(_chewieListener);
      }

      if (_videoPlayerController != null) {
        _videoPlayerController!.removeListener(_videoListener);
      }

      // Safe disposal with null checks
      _chewieController?.dispose();
      _videoPlayerController?.dispose();
    } catch (e) {
      print('Safe disposal error: $e');
    } finally {
      _chewieController = null;
      _videoPlayerController = null;
      _hasCompleted = false;
      _isInitialized = false;
    }
  }

  @override
  void didUpdateWidget(CustomFullScreenVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.path != widget.path) {
      _cleanupPlayer();

      // Delay re-initialization to next frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _isDisposed) return;
        _initializePlayer();
      });
    }
  }

  // Add these lifecycle methods to handle PageView transitions better
  @override
  void deactivate() {
    // This is called when the widget is removed from the widget tree temporarily
    // (like during page transitions in PageView)
    if (_videoPlayerController?.value.isPlaying ?? false) {
      _videoPlayerController?.pause();
    }
    super.deactivate();
  }

  double get width => widget.width == null || widget.width! >= double.infinity
      ? MediaQuery.of(context).size.width
      : widget.width!;

  double get height =>
      widget.height == null || widget.height! >= double.infinity
          ? width / aspectRatio
          : widget.height!;

  double get aspectRatio =>
      widget.aspectRatio ??
          (_chewieController?.videoPlayerController.value.aspectRatio ??
              kDefaultAspectRatio);

  void _chewieListener() {
    if (_isDisposed || !mounted || _chewieController == null) return;
  }

  // Show controls temporarily and start timer to hide them
  void _showControlsTemporarily([int seconds = 3]) {
    if (_isDisposed || !mounted) return;

    // Cancel existing timer if there is one
    _hideControlsTimer?.cancel();

    // Show controls
    if (!_showControls) {
      if (mounted && !_isDisposed) {
        setState(() {
          setState(() => _showControls = true);
        });
      }
    }

    // Set timer to hide controls after specified duration
    _hideControlsTimer = Timer(Duration(seconds: seconds), () {
      if (mounted && !_isDisposed) {
        setState(() => _showControls = false);
      }
    });
  }

  void _videoListener() {
    if (_isDisposed || !mounted || _videoPlayerController == null) return;

    if (_videoPlayerController!.value.hasError && !_loggedError) {
      print('Error: ${_videoPlayerController!.value.errorDescription}');
      _loggedError = true;
    }

    // Pause other videos if this one is playing
    if (_videoPlayerController!.value.isPlaying) {
      for (var other in _videoPlayers) {
        if (other != _videoPlayerController && other.value.isPlaying) {
          other.pause();
        }
      }
    }

    // Handle video completion
    final controller = _videoPlayerController!;
    if (!_hasCompleted &&
        controller.value.isInitialized &&
        controller.value.position >=
            controller.value.duration - const Duration(milliseconds: 300)) {
      _hasCompleted = true;

      // Safely show controls after build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isDisposed && mounted) {
          setState(() {
            _showControls = true;
          });
        }
      });

      // Completion callback
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!_isDisposed && mounted) {
          widget.onVideoComplete?.call();
        }
      });
    }

    // Reset flag if video is restarted or user seeks back
    if (_hasCompleted &&
        controller.value.position <
            controller.value.duration - const Duration(seconds: 1)) {
      _hasCompleted = false;
    }

    // Force state update to refresh time display
    if (mounted && !_isDisposed) {
      safeSetState(() {});
    }
  }

  void _togglePlayPause() {
    if (_videoPlayerController == null) return;

    if (_videoPlayerController!.value.isPlaying) {
      _videoPlayerController!.pause();
    } else {
      _videoPlayerController!.play();
    }

    _showControlsTemporarily();
  }

  void _toggleMute() {
    if (_videoPlayerController == null) return;

    final isMuted = _videoPlayerController!.value.volume == 0;
    _videoPlayerController!.setVolume(isMuted ? 1.0 : 0.0);

    setState(() {});
  }

  void _onProgressTap(TapDownDetails details, BoxConstraints constraints) {
    if (_videoPlayerController == null) return;

    final tapPosition = details.localPosition.dx;
    final totalWidth = constraints.maxWidth;
    final percentage = tapPosition / totalWidth;
    final newPosition =
        percentage * _videoPlayerController!.value.duration.inMilliseconds;
    _videoPlayerController!.seekTo(Duration(milliseconds: newPosition.toInt()));

    _showControlsTemporarily();
  }

  void _goToNextSlide() {
    // Implement navigation to next slide
    print('Navigate to next slide');
    // You would implement your navigation logic here
    // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => NextSlide()));
  }

  void _goToPreviousSlide() {
    // Implement navigation to previous slide
    print('Navigate to previous slide');
    // You would implement your navigation logic here
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  Future<void> _initializePlayer() async {
    if (_isDisposed || !mounted) return;

    try {
      // Create new controller
      _videoPlayerController = widget.videoType == VideoType.network
          ? VideoPlayerController.networkUrl(Uri.parse(widget.path))
          : VideoPlayerController.asset(widget.path);

      // Initialize if not lazy loading
      if (!widget.lazyLoad) {
        await _videoPlayerController!.initialize().then((_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final renderBox =
            _videoKey.currentContext?.findRenderObject() as RenderBox?;
            if (renderBox != null) {
              setState(() {
                _videoRenderedWidth = renderBox.size.width;
                print('Rendered video width: $_videoRenderedWidth');
              });
            }
          });
        });
      }

      // Web autoplay fix
      if (kIsWeb && widget.autoPlay ) {
        _videoPlayerController!.setVolume(0);
        // Future.delayed(const Duration(milliseconds: 500), () {
        //   if (!_isDisposed && mounted && _videoPlayerController != null) {
        //     try {
        //       _videoPlayerController!.setVolume(1);
        //       _videoPlayerController!.play();
        //     } catch (e) {
        //       print("Exception Video $e");
        //     }
        //   }
        // });
      }

      // Create Chewie controller
      if (!_isDisposed && mounted && _videoPlayerController != null) {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          aspectRatio: widget.aspectRatio,
          autoPlay: widget.autoPlay,
          looping: widget.looping,
          showControls: false,
          // We'll use our custom controls
          allowFullScreen: false,
          // Disable fullscreen to prevent navigation issues
          allowPlaybackSpeedChanging: false,
          customControls: const SizedBox.shrink(), // No default controls
        );

        // Add listeners
        _chewieController!.addListener(_chewieListener);
        _videoPlayerController!.addListener(_videoListener);

        // Track this controller
        _videoPlayers.add(_videoPlayerController!);

        _isInitialized = true;

        // Show controls initially for 3 seconds when video is loaded
        _showControlsTemporarily(3);

        if (mounted) setState(() {});
      }
    } catch (e) {
      print('Error initializing player: $e');
      _loggedError = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    final bool isControllerReady = _chewieController != null &&
        _isInitialized &&
        (widget.lazyLoad ||
            _videoPlayerController?.value.isInitialized == true);

    if (!isControllerReady) {
      return _buildLoadingIndicator(context);
    }

    final bool isPlaying = _videoPlayerController!.value.isPlaying;
    final bool isMuted = _videoPlayerController!.value.volume == 0;
    final Duration position = _videoPlayerController!.value.position;
    final Duration duration = _videoPlayerController!.value.duration;
    final double progress = duration.inMilliseconds > 0
        ? position.inMilliseconds / duration.inMilliseconds
        : 0.0;

    return MouseRegion(
      onEnter: (_) => _showControlsTemporarily(),
      onHover: (_) {
        // Reset timer on hover
        if (_showControls) {
          _showControlsTemporarily();
        } else {
          _showControlsTemporarily();
        }
      },
      child: GestureDetector(
        onTap: _showControlsTemporarily,
        child: Container(
          height: height,
          width: width,
          color: widget.allowFullScreen ? Colors.transparent : Colors.black,
          child: Stack(
            children: [
              _buildVideoPlayer(),
              // _buildAnimated(_buildTopOverlay(), _showControls),
              _buildAnimated(_buildCenterPlayPause(isPlaying), _showControls),
              // _buildAnimated(_buildSlideNavigation(), _showControls),
              _buildAnimated(
                  _buildBottomControls(
                      isPlaying, isMuted, position, duration, progress),
                  _showControls),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: widget.allowFullScreen ? Colors.transparent : Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Loading', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimated(Widget child, bool visible) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }

  Widget _buildVideoPlayer() {
    return VisibilityDetector(
      key: Key('video-${widget.path}'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (_videoPlayerController == null ||
            !_videoPlayerController!.value.isInitialized) return;

        if (info.visibleFraction == 0) {
          _videoPlayerController?.pause();
        } else {
          if (widget.autoPlay) {
            _videoPlayerController?.play();
          }
        }
      },
      child: Center(
        key: _videoKey,
        child: AspectRatio(
          aspectRatio: _videoPlayerController!.value.aspectRatio,
          child: Chewie(controller: _chewieController!),
        ),
      ),
    );
  }

  Widget _buildCenterPlayPause(bool isPlaying) {
    return Center(
      child: GestureDetector(
        onTap: _togglePlayPause,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  // Widget _buildSlideNavigation() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         IconButton(
  //           icon: const Icon(Icons.chevron_left, color: Colors.white, size: 36),
  //           onPressed: _goToPreviousSlide,
  //         ),
  //         IconButton(
  //           icon:
  //               const Icon(Icons.chevron_right, color: Colors.white, size: 36),
  //           onPressed: _goToNextSlide,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildBottomControls(bool isPlaying, bool isMuted, Duration position,
      Duration duration, double progress) {
    var controllerAspectRatio = _videoPlayerController?.value.aspectRatio;
    var widthController =
        (_videoRenderedWidth ?? 581) * (controllerAspectRatio ?? 0.561) + 20;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: widget.allowFullScreen ? MediaQuery.sizeOf(context).width >= 1140?widthController :double.infinity: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Progress bar
            LayoutBuilder(
              builder: (context, constraints) {
                return GestureDetector(
                  onTapDown: (details) => _onProgressTap(details, constraints),
                  child: Container(
                    height: 4,
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.3),
                    child: Stack(
                      children: [
                        Container(
                          height: 4,
                          width: constraints.maxWidth * progress,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),

            // Controls row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left controls
                Row(
                  children: [
                    IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white),
                      onPressed: _togglePlayPause,
                    ),
                    IconButton(
                      icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up,
                          color: Colors.white),
                      onPressed: _toggleMute,
                    ),
                    Text(
                      "${_formatDuration(position)} / ${_formatDuration(duration)}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                //
                // Right settings
                if (widget.allowFullScreen)
                  IconButton(
                    icon: const Icon(Icons.fullscreen, color: Colors.white),
                    onPressed: widget.onPressedFullScreen,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
