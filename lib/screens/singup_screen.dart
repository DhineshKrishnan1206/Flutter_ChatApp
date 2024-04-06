
import 'package:chatapp/controllers/signup_controller.dart';

import 'package:flutter/material.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  var formData = GlobalKey<FormState>();
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("SignupScreen"),),
      body: Form(
        key: formData,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: email,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "Email is Requried";
                  }
                },
                decoration: InputDecoration(labelText: "Email"),),
              SizedBox(height: 20,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: password,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "Password is Requried";
                  }
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(labelText: "password"),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(formData.currentState!.validate()){
                  SignUpController.createAccount(context: context, email: email.text, password: password.text);
                }
              }, child: Text("Sign Up"))
              
            ],
          ),
        ),
      )
    );
  }
}
