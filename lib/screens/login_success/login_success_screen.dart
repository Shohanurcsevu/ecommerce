import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_success/components/login_success_screen_body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Success"),
        leading: SizedBox(),
        centerTitle: true,
        
      ),
      body: LoginSucessScreenBody(),
    );
  }
}
