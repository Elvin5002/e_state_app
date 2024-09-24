import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //final Map<String, dynamic> _userData;

  Future<void> signUp(String email, String password) async {
    final userCredentials =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Send verification email
    User? user = userCredentials.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }

    // Optionally, sign out the user immediately to prevent access before email verification
    //await FirebaseAuth.instance.signOut();
  }

  Future<User> login(String email, String password) async {
    final userCredentials =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredentials.user!;
  }

  Future<void> sendVerificationEmail(User user) async {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Sign in with Facebook
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Check if the login was successful
    if (loginResult.status == LoginStatus.success &&
        loginResult.accessToken != null) {
      final AccessToken accessToken = loginResult.accessToken!;
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else {
      // Handle the error
      throw FirebaseAuthException(
        code: loginResult.status.toString(),
        message: loginResult.message,
      );
    }
  }
}
