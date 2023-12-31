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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPlfTxIqEQck1RDd3eP-CwcjNA-1kU9I4',
    appId: '1:752740349166:android:0ae9f624b43c68f55e2fff',
    messagingSenderId: '752740349166',
    projectId: 'rent-4',
    databaseURL: 'https://rent-4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'rent-4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoKdZHSwNMOg98aJxFj5tJYs8aLogRtnM',
    appId: '1:752740349166:ios:d03aa7a7556ac1055e2fff',
    messagingSenderId: '752740349166',
    projectId: 'rent-4',
    databaseURL: 'https://rent-4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'rent-4.appspot.com',
    iosClientId: '752740349166-sqrn2u5o4044gko9aorbo8evdr8if09m.apps.googleusercontent.com',
    iosBundleId: 'com.example.rent',
  );
}
