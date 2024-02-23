import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:to_do_app/api/firebase_api.dart';
import 'package:to_do_app/core/utils/common_utils.dart';
import 'package:to_do_app/core/utils/shared_pref_utils.dart';

class AuthRepo {

  ///Create new account
  Future<Either<String, UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    ///hide keyboard
    hideKeyBoard();
    try {
      final credential =
          await FirebaseApi.authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // save auth in local pref
      SharedPrefUtils.setLoggedIn();
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      }

      if (e.code == 'email-already-in-use') {
        return left('The account already exists for that email.');
      }

      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  ///sign in
  Future<Either<String, UserCredential>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    ///hide keyboard
    hideKeyBoard();
    try {
      final credential =
          await FirebaseApi.authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // save auth in local pref
      SharedPrefUtils.setLoggedIn();
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        left('Wrong password provided for that user.');
      }

      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  ///sign out
  Future<Either<String, bool>> logout() async {
    try {
      await FirebaseApi.authInstance.signOut();
      // save auth in local pref
      SharedPrefUtils.logout();
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

}
