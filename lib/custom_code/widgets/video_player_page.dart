// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    super.key,
    this.width,
    this.height,
    required this.videoUrl,
  });

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  bool isLandscape = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _controller.play(); // Start playing when initialized
          // Check if the video is landscape based on aspect ratio
          isLandscape =
              _controller.value.size.width > _controller.value.size.height;
        });
      })
      ..addListener(() {
        if (_controller.value.isInitialized && !_controller.value.isPlaying) {
          // Check if video is finished and paused
          if (_controller.value.position == _controller.value.duration) {
            // Restart the video when finished
            _controller.seekTo(Duration.zero); // Rewind to the start
            _controller.play(); // Play again from the start
          }
        }
        setState(
            () {}); // Update the UI when the video state changes (for progress bar)
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Video Player: Adjusting for full screen if it's a landscape video
                if (isLandscape)
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                else
                  VideoPlayer(_controller),

                // Show the play button when the video is paused
                if (!_controller.value.isPlaying)
                  const Icon(Icons.play_arrow, size: 60, color: Colors.white),

                // Progress Bar: Displaying how much of the video is complete
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: LinearProgressIndicator(
                      value: _controller.value.isInitialized
                          ? _controller.value.position.inSeconds /
                              _controller.value.duration.inSeconds
                          : 0.0,
                      backgroundColor: Colors.grey[400],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.red), // Customize the progress color
                    ),
                  ),
                ),
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
