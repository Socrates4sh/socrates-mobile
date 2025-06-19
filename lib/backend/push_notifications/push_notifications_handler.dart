import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
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
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'EnterOTP': ParameterData.none(),
  'OnboardingForm': ParameterData.none(),
  'Search': ParameterData.none(),
  'Profile': ParameterData.none(),
  'Bookmarks': ParameterData.none(),
  'HomePageDraft1': ParameterData.none(),
  'MathTopicsDraft1': ParameterData.none(),
  'VideoPage': ParameterData.none(),
  'MathTopicsCopy': ParameterData.none(),
  'SignUp': ParameterData.none(),
  'EmailSignIn': ParameterData.none(),
  'EmailSignUp': ParameterData.none(),
  'HomePageDraft2': ParameterData.none(),
  'SubjectsDraft2': ParameterData.none(),
  'ChaptersDraft1': ParameterData.none(),
  'TopicsDemo': ParameterData.none(),
  'Homepage': ParameterData.none(),
  'HomepageOption2': ParameterData.none(),
  'SubjectsV1': (data) async => ParameterData(
        allParams: {
          'examSequence': getParameter<int>(data, 'examSequence'),
          'grade': getParameter<String>(data, 'grade'),
          'exam': getParameter<String>(data, 'exam'),
        },
      ),
  'SubjectsCopy': (data) async => ParameterData(
        allParams: {
          'exam': getParameter<String>(data, 'exam'),
          'grade': getParameter<String>(data, 'grade'),
        },
      ),
  'Chapters': (data) async => ParameterData(
        allParams: {
          'exam': getParameter<String>(data, 'exam'),
          'grade': getParameter<String>(data, 'grade'),
          'subject': getParameter<String>(data, 'subject'),
          'examSequence': getParameter<int>(data, 'examSequence'),
          'subjectSequence': getParameter<int>(data, 'subjectSequence'),
        },
      ),
  'ChaptersDemo': (data) async => ParameterData(
        allParams: {
          'exam': getParameter<String>(data, 'exam'),
          'grade': getParameter<String>(data, 'grade'),
          'subject': getParameter<String>(data, 'subject'),
        },
      ),
  'NewsLetter': ParameterData.none(),
  'Subjects': (data) async => ParameterData(
        allParams: {
          'exam': getParameter<String>(data, 'exam'),
          'grade': getParameter<String>(data, 'grade'),
          'examSequence': getParameter<int>(data, 'examSequence'),
          'examdoc': await getDocumentParameter<ExamsRecord>(
              data, 'examdoc', ExamsRecord.fromSnapshot),
        },
      ),
  'shortsVideoPage': (data) async => ParameterData(
        allParams: {
          'exam': getParameter<String>(data, 'exam'),
          'grade': getParameter<String>(data, 'grade'),
          'subject': getParameter<String>(data, 'subject'),
          'chapter': getParameter<String>(data, 'chapter'),
          'topic': getParameter<String>(data, 'topic'),
        },
      ),
  'SubjectsCopy3': (data) async => ParameterData(
        allParams: {
          'exam': getParameter<String>(data, 'exam'),
          'grade': getParameter<String>(data, 'grade'),
        },
      ),
  'Topics': (data) async => ParameterData(
        allParams: {
          'examSequence': getParameter<int>(data, 'examSequence'),
          'subjectSequence': getParameter<int>(data, 'subjectSequence'),
          'exam': getParameter<String>(data, 'exam'),
          'grade': getParameter<String>(data, 'grade'),
          'subject': getParameter<String>(data, 'subject'),
          'chapter': getParameter<String>(data, 'chapter'),
          'chapterSequence': getParameter<int>(data, 'chapterSequence'),
        },
      ),
  'TermsofService': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'DeleteAccountWebDraft': ParameterData.none(),
  'DeleteAccountWeb': ParameterData.none(),
  'SubscriptionPage': ParameterData.none(),
  'VerifyCode': ParameterData.none(),
  'HomepageV2': ParameterData.none(),
  'HomepageV3': ParameterData.none(),
  'VideosList': (data) async => ParameterData(
        allParams: {
          'subCategory': getParameter<String>(data, 'subCategory'),
          'websiteCategory': getParameter<String>(data, 'websiteCategory'),
        },
      ),
  'VideoPage_V2': (data) async => ParameterData(
        allParams: {
          'videoDoc': await getDocumentParameter<WebsiteVideosRecord>(
              data, 'videoDoc', WebsiteVideosRecord.fromSnapshot),
          'subCategory': getParameter<String>(data, 'subCategory'),
          'videoSequence': getParameter<double>(data, 'videoSequence'),
          'initialIndex': getParameter<int>(data, 'initialIndex'),
        },
      ),
  'Recommended': ParameterData.none(),
  'MyList': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
