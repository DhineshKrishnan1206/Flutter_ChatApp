import 'package:chatapp/screens/dahsboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignInController{
  static Future<void> loginAccount({required BuildContext context,required String email,required String password})async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return DashboardScreen();}),
              (route){
            return false;
          });
    }catch(e){
      SnackBar message=SnackBar(
          backgroundColor: Colors.red[500],
          content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(message);
    }
  }
}