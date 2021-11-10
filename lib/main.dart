import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './pages/login.dart';
//le programme commence ici

  //void main () async{
   /// runApp(
    //    MaterialApp(
        //    WidgetsFlutterBinding.ensureInitialized();
       //     await Firebase.initializeApp();
       // home:Login (),
   // )

   // );
  //}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Login(),
  ));
}