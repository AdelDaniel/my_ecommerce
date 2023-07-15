import 'package:firebase_core/firebase_core.dart';
import 'package:my_ecommerce/core/config/firebase_keys.dart';

Future<void> firebaseInit() async {
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //   apiKey: apiKey,
  //   authDomain: authDomain,
  //   projectId: projectId,
  //   storageBucket: storageBucket,
  //   messagingSenderId: messagingSenderId,
  //   appId: appId,
  // ));
}
