import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthServices {
  static Future<User> createAccount({required String email , required String password,required String name})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateProfile(displayName: name);
      await credential.user?.updateDisplayName(name);
      await credential.user?.sendEmailVerification();

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      }else{
        throw e.message?? "" ;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<User> login({required String email , required String password,})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw "Email or Password is invaild" ;
    } catch (e) {
      rethrow;
    }
  }


  static Future<void> resetPassword({required String email })async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw "Email is invaild" ;
    } catch (e) {
      rethrow;
    }
  }


  static Future<UserCredential> signInWithGoogle() async {
    try{

      GoogleSignIn.instance.initialize(serverClientId: "596626044859-3hse8sg9jcl68nt8sphd275ufnb54dat.apps.googleusercontent.com");

      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

      if(googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      throw "google account not founded";
    } catch (e){
      rethrow ;
    }
  }


}