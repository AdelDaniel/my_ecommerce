import 'package:firebase_core/firebase_core.dart';

Future<void> firebaseInit() async {
  await Firebase.initializeApp();
}
