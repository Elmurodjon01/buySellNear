import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDLqfRzTSeMV5YRl0rHhX9av6oOa4K18xE",
            authDomain: "johntest-686d9.firebaseapp.com",
            projectId: "johntest-686d9",
            storageBucket: "johntest-686d9.appspot.com",
            messagingSenderId: "181553894391",
            appId: "1:181553894391:web:2c9857c4cde6add93914f2"));
  } else {
    await Firebase.initializeApp();
  }
}
