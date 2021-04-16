import 'package:firebase_messaging/firebase_messaging.dart';

class FirbaseService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static final FirbaseService _instance = FirbaseService._internal();

  factory FirbaseService() {
    return _instance;
  }
  String firebaseToken;

  FirbaseService._internal() {
    _firebaseMessaging.getToken().then((value) {
      firebaseToken = value;
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}
