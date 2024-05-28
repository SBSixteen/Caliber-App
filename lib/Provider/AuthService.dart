// ignore_for_file: camel_case_types
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    
    final GoogleSignInAccount? gUser= await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credentials = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credentials);

  }

  void handleGoogleSignIn(){
    try{
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      final FirebaseAuth _auth = FirebaseAuth.instance;
      _auth.signInWithPopup(_googleAuthProvider);
    }catch (error){

    }
  }
}
