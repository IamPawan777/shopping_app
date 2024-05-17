// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyChq3MPvL8V3hSw2V2BphcvF6phimRw_ZI',
    appId: '1:167673579501:web:402795d41f1bae349509e4',
    messagingSenderId: '167673579501',
    projectId: 'collegeproject-d9dcf',
    authDomain: 'collegeproject-d9dcf.firebaseapp.com',
    storageBucket: 'collegeproject-d9dcf.appspot.com',
    measurementId: 'G-6PQ4E5T2T9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaT7Bvz4-iH61cQhbjtyhblhc_i9uPRWY',
    appId: '1:167673579501:android:666fc80d6e6834bb9509e4',
    messagingSenderId: '167673579501',
    projectId: 'collegeproject-d9dcf',
    storageBucket: 'collegeproject-d9dcf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOaW8f9XqGZVjhPL3IwPHPpWpDxBGX0aQ',
    appId: '1:167673579501:ios:8f9afa25d2e512609509e4',
    messagingSenderId: '167673579501',
    projectId: 'collegeproject-d9dcf',
    storageBucket: 'collegeproject-d9dcf.appspot.com',
    iosBundleId: 'com.example.scrapyad',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyChq3MPvL8V3hSw2V2BphcvF6phimRw_ZI',
    appId: '1:167673579501:web:273107974df3ee929509e4',
    messagingSenderId: '167673579501',
    projectId: 'collegeproject-d9dcf',
    authDomain: 'collegeproject-d9dcf.firebaseapp.com',
    storageBucket: 'collegeproject-d9dcf.appspot.com',
    measurementId: 'G-E5HFJXWWW9',
  );
}
