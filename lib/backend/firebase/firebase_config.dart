import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDn6Y12yd5OQvlfpjS3W8F2WYoNi4EiJj0",
            authDomain: "race-control-01-2026.firebaseapp.com",
            projectId: "race-control-01-2026",
            storageBucket: "race-control-01-2026.firebasestorage.app",
            messagingSenderId: "697332651721",
            appId: "1:697332651721:web:f7455ad775a37c3b241f18",
            measurementId: "G-KXJCCKKPNT"));
  } else {
    await Firebase.initializeApp();
  }
}
