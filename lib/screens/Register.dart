import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/actions/auth.dart';
import 'package:my_tasks/constants.dart';
import 'package:my_tasks/screens/Home.dart';
import 'package:my_tasks/widgets/buttons/btn-auth.dart';
import 'package:my_tasks/widgets/forms/auth_Input.dart';
import 'package:my_tasks/widgets/loadingIndicators/spin_kit_dual_ring.dart';
import '../constants.dart';
import '../size_config.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  static const String route = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
            decoration: BoxDecoration(
              color: kBgColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
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
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _form = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _isVisible = false;

  String _email;
  String _password;
  String _mobile;
  String _name;

  void _register() async {
    setState(() => _isLoading = true);
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    var data = {
      'email': _email,
      'password': _password,
      'username': _name,
    };
    var res = await Auth().register(data);
    if (res['status'] == 'success') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            res['msg'],
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamedAndRemoveUntil(context, Home.route, (route) => false);
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
            label: 'Your Name',
            hint: 'Enter your name',
            inputType: TextInputType.text,
            icon: Icon(Icons.person, color: kButtonColor),
            focusNode: _nameFocusNode,
            onChanged: (val) => _name = val,
            validator: (val) {
              if (val.trim().isEmpty) return "This field is required";
              return null;
            },
          ),
          SizedBox(height: 15),
          AuthInput(
            label: 'Email Address',
            hint: 'Enter email address',
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
          // SizedBox(height: 15),
          // AuthInput(
          //   label: 'Mobile Number',
          //   hint: 'Enter Mobile Number',
          //   inputType: TextInputType.number,
          //   icon: Icon(Icons.phone, color: kButtonColor),
          //   focusNode: _mobileFocusNode,
          //   onChanged: (val) => _mobile = val,
          //   validator: (val) {
          //     if (val.trim().isEmpty) return "This field is required";
          //     bool isValid = val.length == 10;
          //     if (!isValid) return 'Invalid Email';
          //     return null;
          //   },
          // ),
          SizedBox(height: 15),
          AuthInput(
            label: 'Password',
            hint: 'Enter password',
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
          SizedBox(height: 25),
          _isLoading
              ? Center(
                  child: SpinkitDualRing(color: Colors.white),
                )
              : BtnAuth(
                  text: 'Register',
                  onPressed: _register,
                ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: _isLoading
                    ? null
                    : () {
                        Navigator.of(context).pushNamed(Login.route);
                      },
                child: Text(
                  'Login',
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
