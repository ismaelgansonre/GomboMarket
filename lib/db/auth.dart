import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom/db/database.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Create custom user object
  User _userFromFirebaseUser(User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    FirebaseAuth.instance.authStateChanges().listen((_userFromFirebaseUser) {
      return _userFromFirebaseUser;
    });
  }

  Future signInWithEmailAndPassword(String email, String Password) async {
    try {
      User user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email.trim(), password: Password.trim()))
          .user;
      print('Signed in: ${user.uid}');
      //return user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Error in AuthSignIn: " + e.toString());

      if (e.toString().contains("ERROR_USER_NOT_FOUND")) {
        return "ERROR_USER_NOT_FOUND";
      } else if (e.toString().contains("ERROR_WRONG_PASSWORD")) {
        return "ERROR_WRONG_PASSWORD";
      } else {
        return null;
      }
    }
  }

  Future registerWithEmailAndPassword(
      String email, String password, Map data_map) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      //user.updateProfile({displayName: })
      print("User uid: " + user.uid);

      data_map.putIfAbsent("userId", () => user.uid);
      await DatabaseService(uid: user.uid).updateUserData(data_map);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Sign up Unsuccessful " + e.toString());
      if (e.toString().contains("ERROR_EMAIL_ALREADY_IN_USE")) {
        return "ERROR_EMAIL_ALREADY_IN_USE";
      } else {
        return null;
      }
    }
  }

  Future currentUser() async {
    User user = _firebaseAuth.currentUser;
    return user;
  }

  Future signOut() async {
    try {
      print("SIGNED OUT CALLED");
      return await _firebaseAuth.signOut();
    } catch (e) {
      print("Error signing out: " + e.toString());
      return null;
    }
  }
}
