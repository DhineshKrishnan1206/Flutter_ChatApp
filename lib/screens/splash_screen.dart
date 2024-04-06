import 'package:chatapp/screens/dahsboard_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
Future.delayed(Duration(seconds: 3),(){
if(user==null){
  openLogin();
}else{
  openDashboard();
}
});
    super.initState();
  }
  void openLogin(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return LoginScreen();
    }));
  }
  void openDashboard(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return DashboardScreen();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SplashScreen"),),
    );
  }
}
