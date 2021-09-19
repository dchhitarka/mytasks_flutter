import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_tasks/actions/auth.dart';
import 'package:my_tasks/constants.dart';
import 'package:my_tasks/screens/Login.dart';
import 'package:my_tasks/screens/Home.dart';
import 'package:my_tasks/size_config.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  static const String route = '/splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  static const String route = '/splash';
  var _auth = Auth();
  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  void startTimer(context) {
    Timer(Duration(seconds: 3), () {
      navigateUser(context); //It will redirect  after 3 seconds
    });
  }

  void popupMsg(context, msg, color) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          msg ?? 'Continue',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
      ),
    );
  }

  void navigateUser(context) async {
    final fsc = FlutterSecureStorage();
    if ((await fsc.containsKey(key: 'token')) == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
      // var res = await _auth.getUser();
      // if (res['status'] == 'success') {
      //   popupMsg(context, res['msg'], Colors.greenAccent);
      // } else {
      //   popupMsg(context, res['msg'], Colors.redAccent);
      // }

      // if (firebaseAuth.currentUser.email == 'admin@muktafs.com') {
      //   Navigator.pushReplacementNamed(context, Home.route);
      // } else {
      //   Navigator.pushReplacementNamed(context, Home.route);
      // }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _auth = Provider.of<Auth>(context);
    });
    startTimer(context);
    return SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kBgColor,
          child: Center(
            child: Text(
              'My Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
