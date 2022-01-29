import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseInjectableModule {
  const FirebaseInjectableModule();
  static GoogleSignIn get googleSingIn => GoogleSignIn();
  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
