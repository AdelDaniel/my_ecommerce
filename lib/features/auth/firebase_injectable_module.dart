import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseInjectableModule {
  static const String _usersCollectionName = "users";
  const FirebaseInjectableModule();
  static GoogleSignIn get googleSingIn => GoogleSignIn();
  static FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  static CollectionReference get userCollectionReference =>
      FirebaseFirestore.instance.collection(_usersCollectionName);
  //  static DocumentReference get userDoc =>   FirebaseFirestore.instance.collection(_usersCollectionName).doc(userId)
}
