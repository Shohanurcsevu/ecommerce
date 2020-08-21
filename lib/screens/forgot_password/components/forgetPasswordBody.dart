import 'package:flutter/material.dart';
import 'package:shop_app/screens/forgot_password/components/forget_password_form.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/components/no_account_text.dart';

class ForgetPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Text(
                  "Forget Password",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  "Please enter your email and we will \nsend a link to return to your account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                ForgetPasswordForm(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

