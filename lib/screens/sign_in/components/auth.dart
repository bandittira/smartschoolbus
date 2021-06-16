import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future checkUser() async {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
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

  Future registerWithEmailAndPasword(
    String _email,
    String _password,
  ) async {
    var loginkey = GlobalKey<ScaffoldState>();
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      User user = userCredential.user;
      return user.uid;
    } on FirebaseAuthException catch (signUpError) {
      if (signUpError.code == 'email-already-in-use') {
        print('The email already exists');
        return loginkey.currentState
            .showSnackBar(SnackBar(content: Text("Email already exist")));
      }
    } catch (signUpError) {
      print(signUpError.toString());
      return SnackBar(content: Text("Register already"));
    }
  }

  Future signInWithEmailAndPasword(String email, String password) async {
    var loginkey = GlobalKey<ScaffoldState>();
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
        return loginkey.currentState
            .showSnackBar(SnackBar(content: Text("User not found")));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return loginkey.currentState
            .showSnackBar(SnackBar(content: Text("Wrong password")));
      }
    } catch (e) {
      print(e);
      return null;
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
