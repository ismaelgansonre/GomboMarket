import 'package:firebase_core/firebase_core.dart';
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

class _LoginState extends State<Login> {

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
    GoogleSignInAuthentication googleSignInAuthentication =
    googleUser.authentication as GoogleSignInAuthentication;
    final User user = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken) as User;

    if (user != null) {


      final QuerySnapshot result = (FirebaseFirestore.instance
          .collection("user")
          .where("id", isEqualTo: user.uid)
          .snapshots()) as QuerySnapshot<Object>;

      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        FirebaseFirestore.instance.collection("user").doc(user.uid).set({
          "id": user.uid,
          "username": user.displayName,
          "profilePicture": user.photoURL,
          "email": user.email,
          //"createdAt": DateTime.now().millisecondsSinceEpoch.toString(),
          // "chattingWith": null
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("username", user.displayName);
        await preferences.setString("profilePicture", user.photoURL);
        await preferences.setString("email", user.email);
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("username", documents[0]["username"]);
        await preferences.setString(
            "profilePicture", documents[0]["profilePicture"]);
        await preferences.setString("email", documents[0]["email"]);
      }
    }
    Fluttertoast.showToast(msg: "Login was successful");
    setState(() {
      loading = false;
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text ("Login", style: TextStyle(color: Colors.redAccent),),
        elevation: 0.1,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: FlatButton(
              color: Colors.red.shade50,
              onPressed: () {
                handleSignIn();
              },
              child: Text("Sign In/Sign up with google",
                style: TextStyle(color: Colors.white),),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                )
            ),
          )
        ],
      ),

      bottomNavigationBar: Container(
        child:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red.shade50,
              onPressed: () {
                handleSignIn();
              },
              child: Text("Sign In/Sign up with google",
                style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }

  Future handleSignIn() async {

    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
  }
}
