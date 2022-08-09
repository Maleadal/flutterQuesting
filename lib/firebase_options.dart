// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCx7yhqBDgB-_ba5dDl2SRmWev6QAjD2g8',
    appId: '1:519979588411:web:56c04e38adaf697c37f51e',
    messagingSenderId: '519979588411',
    projectId: 'notes-flutter-project-c8594',
    authDomain: 'notes-flutter-project-c8594.firebaseapp.com',
    storageBucket: 'notes-flutter-project-c8594.appspot.com',
    measurementId: 'G-DX3QZP5VB9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAy2RYkfVOpZ51v0-cmpQyFq-q5fr3GgUY',
    appId: '1:519979588411:android:47cc34cbc85d9f6a37f51e',
    messagingSenderId: '519979588411',
    projectId: 'notes-flutter-project-c8594',
    storageBucket: 'notes-flutter-project-c8594.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3m5bCpICyvoZS8QyI016NMiyGBnaUw5k',
    appId: '1:519979588411:ios:b2000f76cf06fc4a37f51e',
    messagingSenderId: '519979588411',
    projectId: 'notes-flutter-project-c8594',
    storageBucket: 'notes-flutter-project-c8594.appspot.com',
    iosClientId: '519979588411-ua6725h0hb9jbngdif14b8maohu3nvcn.apps.googleusercontent.com',
    iosBundleId: 'com.example.testProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3m5bCpICyvoZS8QyI016NMiyGBnaUw5k',
    appId: '1:519979588411:ios:b2000f76cf06fc4a37f51e',
    messagingSenderId: '519979588411',
    projectId: 'notes-flutter-project-c8594',
    storageBucket: 'notes-flutter-project-c8594.appspot.com',
    iosClientId: '519979588411-ua6725h0hb9jbngdif14b8maohu3nvcn.apps.googleusercontent.com',
    iosBundleId: 'com.example.testProject',
  );
}
