import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../home_screen/view/home_screen.dart';

class AuthPov extends ChangeNotifier {
  final FirebaseAuth _auth;

  AuthPov(this._auth);

  Future<String> googleSignin() async {
    try {
      final isLoged = await GoogleSignIn().isSignedIn();
      if (isLoged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        return Future.value('while error occured');
      }
      final cred = await result.authentication;
      await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: cred.accessToken,
          idToken: cred.idToken,
        ),
      );

      Routes.pushreplace(screen: const HomeScreen());

      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      return Future.value(ex.message);
    }
  }
}
