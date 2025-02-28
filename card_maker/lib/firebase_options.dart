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
    apiKey: 'AIzaSyDC2O0B1N8DVxUWWRTZAsU9ubicPbp3Y4I',
    appId: '1:609184800553:web:3af3cdc3169a6357072138',
    messagingSenderId: '609184800553',
    projectId: 'cardmaker-d1408',
    authDomain: 'cardmaker-d1408.firebaseapp.com',
    storageBucket: 'cardmaker-d1408.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQw0jFn-VReXXmMLcV3gtHR_jHt1pYtsU',
    appId: '1:609184800553:android:afbf48dbfb90d87c072138',
    messagingSenderId: '609184800553',
    projectId: 'cardmaker-d1408',
    storageBucket: 'cardmaker-d1408.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqZIxvQwMTqWDJHQnrSilOf31IGssAiAo',
    appId: '1:609184800553:ios:e3ce9c135b68ddb0072138',
    messagingSenderId: '609184800553',
    projectId: 'cardmaker-d1408',
    storageBucket: 'cardmaker-d1408.appspot.com',
    iosClientId: '609184800553-v8cb7kr66n6sfbaab7291tjjdj8bmk65.apps.googleusercontent.com',
    iosBundleId: 'com.amanchaturvedi.cardMaker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqZIxvQwMTqWDJHQnrSilOf31IGssAiAo',
    appId: '1:609184800553:ios:e3ce9c135b68ddb0072138',
    messagingSenderId: '609184800553',
    projectId: 'cardmaker-d1408',
    storageBucket: 'cardmaker-d1408.appspot.com',
    iosClientId: '609184800553-v8cb7kr66n6sfbaab7291tjjdj8bmk65.apps.googleusercontent.com',
    iosBundleId: 'com.amanchaturvedi.cardMaker',
  );
}
