import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBZQwDk0WVHhOGFISh9KVMSL0XmlFInkJ8",
            authDomain: "education-4sh.firebaseapp.com",
            projectId: "education-4sh",
            storageBucket: "education-4sh.appspot.com",
            messagingSenderId: "399924722785",
            appId: "1:399924722785:web:779a8c0527dcb99b273e20",
            measurementId: "G-YQS724LPMS"));
  } else {
    await Firebase.initializeApp();
  }
}
