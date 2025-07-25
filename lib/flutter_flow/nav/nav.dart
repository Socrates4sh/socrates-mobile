import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SignUpWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SignUpWidget(),
        ),
        FFRoute(
          name: EnterOTPWidget.routeName,
          path: EnterOTPWidget.routePath,
          builder: (context, params) => EnterOTPWidget(),
        ),
        FFRoute(
          name: OnboardingFormWidget.routeName,
          path: OnboardingFormWidget.routePath,
          builder: (context, params) => OnboardingFormWidget(),
        ),
        FFRoute(
            name: SearchWidget.routeName,
            path: SearchWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: SearchWidget(),
                )),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: BookmarksWidget.routeName,
          path: BookmarksWidget.routePath,
          builder: (context, params) => BookmarksWidget(),
        ),
        FFRoute(
          name: HomePageDraft1Widget.routeName,
          path: HomePageDraft1Widget.routePath,
          builder: (context, params) => HomePageDraft1Widget(),
        ),
        FFRoute(
          name: MathTopicsDraft1Widget.routeName,
          path: MathTopicsDraft1Widget.routePath,
          builder: (context, params) => MathTopicsDraft1Widget(),
        ),
        FFRoute(
          name: VideoPageWidget.routeName,
          path: VideoPageWidget.routePath,
          builder: (context, params) => VideoPageWidget(),
        ),
        FFRoute(
          name: MathTopicsCopyWidget.routeName,
          path: MathTopicsCopyWidget.routePath,
          builder: (context, params) => MathTopicsCopyWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: EmailSignInWidget.routeName,
          path: EmailSignInWidget.routePath,
          builder: (context, params) => EmailSignInWidget(),
        ),
        FFRoute(
          name: EmailSignUpWidget.routeName,
          path: EmailSignUpWidget.routePath,
          builder: (context, params) => EmailSignUpWidget(),
        ),
        FFRoute(
          name: HomePageDraft2Widget.routeName,
          path: HomePageDraft2Widget.routePath,
          builder: (context, params) => HomePageDraft2Widget(),
        ),
        FFRoute(
          name: SubjectsDraft2Widget.routeName,
          path: SubjectsDraft2Widget.routePath,
          builder: (context, params) => SubjectsDraft2Widget(),
        ),
        FFRoute(
          name: ChaptersDraft1Widget.routeName,
          path: ChaptersDraft1Widget.routePath,
          builder: (context, params) => ChaptersDraft1Widget(),
        ),
        FFRoute(
          name: TopicsDemoWidget.routeName,
          path: TopicsDemoWidget.routePath,
          builder: (context, params) => TopicsDemoWidget(),
        ),
        FFRoute(
            name: HomepageWidget.routeName,
            path: HomepageWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: HomepageWidget(),
                )),
        FFRoute(
          name: HomepageOption2Widget.routeName,
          path: HomepageOption2Widget.routePath,
          builder: (context, params) => HomepageOption2Widget(),
        ),
        FFRoute(
            name: SubjectsV1Widget.routeName,
            path: SubjectsV1Widget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: SubjectsV1Widget(
                    examSequence: params.getParam(
                      'examSequence',
                      ParamType.int,
                    ),
                    grade: params.getParam(
                      'grade',
                      ParamType.String,
                    ),
                    exam: params.getParam(
                      'exam',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: SubjectsCopyWidget.routeName,
          path: SubjectsCopyWidget.routePath,
          builder: (context, params) => SubjectsCopyWidget(
            exam: params.getParam(
              'exam',
              ParamType.String,
            ),
            grade: params.getParam(
              'grade',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
            name: ChaptersWidget.routeName,
            path: ChaptersWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ChaptersWidget(
                    exam: params.getParam(
                      'exam',
                      ParamType.String,
                    ),
                    grade: params.getParam(
                      'grade',
                      ParamType.String,
                    ),
                    subject: params.getParam(
                      'subject',
                      ParamType.String,
                    ),
                    examSequence: params.getParam(
                      'examSequence',
                      ParamType.int,
                    ),
                    subjectSequence: params.getParam(
                      'subjectSequence',
                      ParamType.int,
                    ),
                  ),
                )),
        FFRoute(
          name: ChaptersDemoWidget.routeName,
          path: ChaptersDemoWidget.routePath,
          builder: (context, params) => ChaptersDemoWidget(
            exam: params.getParam(
              'exam',
              ParamType.String,
            ),
            grade: params.getParam(
              'grade',
              ParamType.String,
            ),
            subject: params.getParam(
              'subject',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
            name: NewsLetterWidget.routeName,
            path: NewsLetterWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NewsLetterWidget(),
                )),
        FFRoute(
            name: SubjectsWidget.routeName,
            path: SubjectsWidget.routePath,
            asyncParams: {
              'examdoc': getDoc(['exams'], ExamsRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: SubjectsWidget(
                    exam: params.getParam(
                      'exam',
                      ParamType.String,
                    ),
                    grade: params.getParam(
                      'grade',
                      ParamType.String,
                    ),
                    examSequence: params.getParam(
                      'examSequence',
                      ParamType.int,
                    ),
                    examdoc: params.getParam(
                      'examdoc',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
          name: ShortsVideoPageWidget.routeName,
          path: ShortsVideoPageWidget.routePath,
          builder: (context, params) => ShortsVideoPageWidget(
            exam: params.getParam(
              'exam',
              ParamType.String,
            ),
            grade: params.getParam(
              'grade',
              ParamType.String,
            ),
            subject: params.getParam(
              'subject',
              ParamType.String,
            ),
            chapter: params.getParam(
              'chapter',
              ParamType.String,
            ),
            topic: params.getParam(
              'topic',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SubjectsCopy3Widget.routeName,
          path: SubjectsCopy3Widget.routePath,
          builder: (context, params) => SubjectsCopy3Widget(
            exam: params.getParam(
              'exam',
              ParamType.String,
            ),
            grade: params.getParam(
              'grade',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
            name: TopicsWidget.routeName,
            path: TopicsWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: TopicsWidget(
                    examSequence: params.getParam(
                      'examSequence',
                      ParamType.int,
                    ),
                    subjectSequence: params.getParam(
                      'subjectSequence',
                      ParamType.int,
                    ),
                    exam: params.getParam(
                      'exam',
                      ParamType.String,
                    ),
                    grade: params.getParam(
                      'grade',
                      ParamType.String,
                    ),
                    subject: params.getParam(
                      'subject',
                      ParamType.String,
                    ),
                    chapter: params.getParam(
                      'chapter',
                      ParamType.String,
                    ),
                    chapterSequence: params.getParam(
                      'chapterSequence',
                      ParamType.int,
                    ),
                  ),
                )),
        FFRoute(
          name: TermsofServiceWidget.routeName,
          path: TermsofServiceWidget.routePath,
          builder: (context, params) => TermsofServiceWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: DeleteAccountWebDraftWidget.routeName,
          path: DeleteAccountWebDraftWidget.routePath,
          builder: (context, params) => DeleteAccountWebDraftWidget(),
        ),
        FFRoute(
          name: DeleteAccountWebWidget.routeName,
          path: DeleteAccountWebWidget.routePath,
          builder: (context, params) => DeleteAccountWebWidget(),
        ),
        FFRoute(
            name: SubscriptionPageWidget.routeName,
            path: SubscriptionPageWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: SubscriptionPageWidget(),
                )),
        FFRoute(
          name: VerifyCodeWidget.routeName,
          path: VerifyCodeWidget.routePath,
          builder: (context, params) => VerifyCodeWidget(),
        ),
        FFRoute(
            name: HomepageV2Widget.routeName,
            path: HomepageV2Widget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: HomepageV2Widget(),
                )),
        FFRoute(
            name: HomepageV3Widget.routeName,
            path: HomepageV3Widget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'HomepageV3')
                : NavBarPage(
                    initialPage: 'HomepageV3',
                    page: HomepageV3Widget(),
                  )),
        FFRoute(
            name: VideosListWidget.routeName,
            path: VideosListWidget.routePath,
            asyncParams: {
              'videosDocs': getDocList(
                  ['WebsiteVideos'], WebsiteVideosRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: VideosListWidget(
                    videosDocs: params.getParam<WebsiteVideosRecord>(
                      'videosDocs',
                      ParamType.Document,
                      isList: true,
                    ),
                    subCategory: params.getParam(
                      'subCategory',
                      ParamType.String,
                    ),
                    websiteCategory: params.getParam(
                      'websiteCategory',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: VideoPageV2Widget.routeName,
          path: VideoPageV2Widget.routePath,
          builder: (context, params) => VideoPageV2Widget(
            subCategory: params.getParam(
              'subCategory',
              ParamType.String,
            ),
            videoSequence: params.getParam(
              'videoSequence',
              ParamType.double,
            ),
            initialIndex: params.getParam(
              'initialIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
            name: RecommendedWidget.routeName,
            path: RecommendedWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Recommended')
                : NavBarPage(
                    initialPage: 'Recommended',
                    page: RecommendedWidget(),
                  )),
        FFRoute(
            name: MyListWidget.routeName,
            path: MyListWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: MyListWidget(),
                )),
        FFRoute(
            name: SubscriptionPageRazorPayWidget.routeName,
            path: SubscriptionPageRazorPayWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: SubscriptionPageRazorPayWidget(),
                )),
        FFRoute(
            name: CancellationRazorPayWidget.routeName,
            path: CancellationRazorPayWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: CancellationRazorPayWidget(),
                ))
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signUp';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
