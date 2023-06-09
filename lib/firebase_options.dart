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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA3Ka_T_jtaGvyKkO8R6AzABj21gCcW2nU',
    appId: '1:72306507527:web:3fd74ff59b459ef1f80fa2',
    messagingSenderId: '72306507527',
    projectId: 'boocont-e383a',
    authDomain: 'boocont-e383a.firebaseapp.com',
    storageBucket: 'boocont-e383a.appspot.com',
    measurementId: 'G-DS4S7KE1NH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDw8DMC6akftA7tVPuX65prVK46ebP515k',
    appId: '1:72306507527:android:c62f30714dbe339bf80fa2',
    messagingSenderId: '72306507527',
    projectId: 'boocont-e383a',
    storageBucket: 'boocont-e383a.appspot.com',
  );
}
