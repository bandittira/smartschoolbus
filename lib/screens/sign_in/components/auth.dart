import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartschoolbus/screens/sign_in/components/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Firebaseusertest _userFromFirebaseUser(User user) {
    return user != null ? Firebaseusertest(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Firebaseusertest> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

// sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPasword(String username, String password,
      String email, String phonenumber) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // User user = userCredential.user;
      // return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The email already exists');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInWithEmailAndPasword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("user not found");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
}
