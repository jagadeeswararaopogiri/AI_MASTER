import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHMIdO3RTrGnDj5FeZMEze1JjrUz57tOQ",
            authDomain: "ai-stydy-x3tr8r.firebaseapp.com",
            projectId: "ai-stydy-x3tr8r",
            storageBucket: "ai-stydy-x3tr8r.firebasestorage.app",
            messagingSenderId: "964511824793",
            appId: "1:964511824793:web:d27576605f123798a33108"));
  } else {
    await Firebase.initializeApp();
  }
}
