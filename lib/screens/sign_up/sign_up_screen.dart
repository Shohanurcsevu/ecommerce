import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/components/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
   static String routeName = "\sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Sign Up "),
        centerTitle: true,
      ),
      body: SignUpScreenBody(),
      
    );
  }
}