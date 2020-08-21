import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffixIcon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


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
