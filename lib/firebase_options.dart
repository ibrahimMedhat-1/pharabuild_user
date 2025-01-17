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
    apiKey: 'AIzaSyCu8i4tTSZNZ9n4iIiZP2RtUqWuxTdQ6I8',
    appId: '1:813003557226:web:f21f6e4101fc76b6e7bd13',
    messagingSenderId: '813003557226',
    projectId: 'pharabuild-eec4a',
    authDomain: 'pharabuild-eec4a.firebaseapp.com',
    storageBucket: 'pharabuild-eec4a.appspot.com',
    measurementId: 'G-MKPEJ4W9NX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwhYkQKbvappi9VqDCuUhTFw5kBJyro3s',
    appId: '1:813003557226:android:6b103439fe435647e7bd13',
    messagingSenderId: '813003557226',
    projectId: 'pharabuild-eec4a',
    storageBucket: 'pharabuild-eec4a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNPdz23s_4CNzONzeCDPtB-UTJmfic4cI',
    appId: '1:813003557226:ios:b13c1ee341898d88e7bd13',
    messagingSenderId: '813003557226',
    projectId: 'pharabuild-eec4a',
    storageBucket: 'pharabuild-eec4a.appspot.com',
    iosBundleId: 'com.example.intelligentPharmacy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNPdz23s_4CNzONzeCDPtB-UTJmfic4cI',
    appId: '1:813003557226:ios:0e5e6a42fa164056e7bd13',
    messagingSenderId: '813003557226',
    projectId: 'pharabuild-eec4a',
    storageBucket: 'pharabuild-eec4a.appspot.com',
    iosBundleId: 'com.example.intelligentpharmacy.intelligentPharmacy.RunnerTests',
  );
}
