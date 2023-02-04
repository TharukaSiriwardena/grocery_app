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
    apiKey: 'AIzaSyD1r8wtUgtaQJZL22TEUjY4Pf2fHxjcobs',
    appId: '1:685157223009:web:bb0a7b576696bdbe323820',
    messagingSenderId: '685157223009',
    projectId: 'grocery-app-c3055',
    authDomain: 'grocery-app-c3055.firebaseapp.com',
    storageBucket: 'grocery-app-c3055.appspot.com',
    measurementId: 'G-5JYYBP4BMD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCyqyK8PrEdab2En2q9-VSQftDPNVH3iI',
    appId: '1:685157223009:android:eb8a536ea4878f22323820',
    messagingSenderId: '685157223009',
    projectId: 'grocery-app-c3055',
    storageBucket: 'grocery-app-c3055.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAu6j2PL5fTipfq3f-V5TrzC86h19n639w',
    appId: '1:685157223009:ios:ce75529bf05d909c323820',
    messagingSenderId: '685157223009',
    projectId: 'grocery-app-c3055',
    storageBucket: 'grocery-app-c3055.appspot.com',
    iosClientId: '685157223009-3c1g46lf2r1kq8thvv6qrr8fc6cgaf0k.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAu6j2PL5fTipfq3f-V5TrzC86h19n639w',
    appId: '1:685157223009:ios:ce75529bf05d909c323820',
    messagingSenderId: '685157223009',
    projectId: 'grocery-app-c3055',
    storageBucket: 'grocery-app-c3055.appspot.com',
    iosClientId: '685157223009-3c1g46lf2r1kq8thvv6qrr8fc6cgaf0k.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceryApp',
  );
}