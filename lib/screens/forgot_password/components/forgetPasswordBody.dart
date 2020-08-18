import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffixIcon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
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

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formkey = GlobalKey<FormState>();
  String femail;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildFogetEmailFormField(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight*0.01,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildFogetEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newvalue) => femail = newvalue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }

        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }
}
