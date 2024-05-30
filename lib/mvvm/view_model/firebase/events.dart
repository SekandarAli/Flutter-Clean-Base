// ignore_for_file: avoid_print

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logEvent({
    required String eventName,
    String? clickEvent,
  }) async {
    try {
      await _analytics.logEvent(
        name: eventName,
        parameters: <String, dynamic>{
          'clickEvent': clickEvent,
        },
      );
      print('Logged Firebase Analytics event: $eventName');
    } catch (e) {
      print('Error logging Firebase Analytics event: $e');
    }
  }
}

