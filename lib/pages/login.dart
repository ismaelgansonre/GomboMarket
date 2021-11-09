import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

}


class _LoginState   extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }


  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();

    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
    Future handleSignIn() async {
      preferences = await SharedPreferences.getInstance();
      setState(() {
        loading = true;
      });
    }
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = googleUser
        .authentication as GoogleSignInAuthentication;
    final User user = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken) as User;
    if (user != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance.collection(
          "user").where("id", isEqualTo: user.uid).do
//VIDEO 27  you need to solve QuerySnapshot problem
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        FirebaseFirestore.instance.collection("user")
            .doc(user.uid)
            .set({
          "id": user.uid,
          "username": user.displayName,
          "profilePicture": user.photoURL
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("username", user.displayName);
        await preferences.setString("profilePicture", user.displayName);
        }
    } else {
      await preferences.setString("id", documents[0]['id']);
      await preferences.setString("username", documents[0]['username']);
      await preferences.setString("profilePicture", documents[0]['profilePicture']);


    }
    Fluttertoast.showToast(msg: "Login was successful");
    setState(() {
      loading = false;
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    Fluttertoast.showToast(msg: "Login failed :(");
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }




