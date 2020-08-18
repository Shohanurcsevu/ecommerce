import 'package:flutter/material.dart';
import 'package:shop_app/screens/forgot_password/components/forgetPasswordBody.dart';
class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,

      ),

      body: ForgetPasswordBody(),

      


    );
  }
}
