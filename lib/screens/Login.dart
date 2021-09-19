import 'dart:async';

import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/actions/auth.dart';
import 'package:my_tasks/constants.dart';
import 'package:my_tasks/screens/Register.dart';
import 'package:my_tasks/screens/Home.dart';
import 'package:my_tasks/widgets/buttons/btn-auth.dart';
import 'package:my_tasks/widgets/forms/auth_Input.dart';
import 'package:my_tasks/widgets/loadingIndicators/spin_kit_dual_ring.dart';

class Login extends StatefulWidget {
  static const String route = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            color: kBgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 3,
                width: 50,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _isVisible = false;

  String _email;
  String _password;

  void _login() async {
    setState(() => _isLoading = true);
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    var res = await Auth().login(_email, _password);
    if (res['status'] == 'success') {
      Navigator.pushReplacementNamed(context, Home.route);
    } else {
      setState(() => _isLoading = true);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            res['msg'],
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthInput(
            label: 'Email Address',
            hint: 'Enter email address',
            // initialValue: "test@test.com",
            inputType: TextInputType.emailAddress,
            icon: Icon(Icons.email, color: kButtonColor),
            focusNode: _emailFocusNode,
            onChanged: (val) => _email = val,
            validator: (val) {
              if (val.trim().isEmpty) return "This field is required";
              bool isValid = EmailValidator.validate(val);
              if (!isValid) return 'Invalid Email';
              return null;
            },
          ),
          SizedBox(height: 15),
          AuthInput(
            label: 'Password',
            hint: 'Enter password',
            // initialValue: 'LongChen123',
            icon: Icon(
              _isVisible ? Icons.visibility : Icons.visibility_off,
              color: kButtonColor,
            ),
            onIconPressed: () => setState(() => _isVisible = !_isVisible),
            isPassword: !_isVisible,
            focusNode: _passwordFocusNode,
            onChanged: (val) => _password = val,
            validator: (val) {
              if (val.trim().isEmpty) return "This field is required";
              if (val.trim().length < 8)
                return 'Password must be atleast 8 charachers';
              return null;
            },
          ),
          SizedBox(height: 10),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: GestureDetector(
          //     onTap: () => {},
          //     // Navigator.of(context)
          //     // .pushNamed(ForgotPasswordScreen.routeName),
          //     child: Text(
          //       'Forgot Password',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 25),
          _isLoading
              ? Center(
                  child: SpinkitDualRing(color: Colors.white),
                )
              : BtnAuth(
                  text: 'Login',
                  onPressed: _login,
                ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: _isLoading
                    ? null
                    : () {
                        Navigator.of(context).pushNamed(Register.route);
                      },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
