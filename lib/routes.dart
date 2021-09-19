import 'package:flutter/cupertino.dart';
import 'package:my_tasks/screens/Login.dart';
import 'package:my_tasks/screens/Register.dart';
import 'package:my_tasks/screens/Splash.dart';
import 'package:my_tasks/screens/Task.dart';
import 'package:my_tasks/screens/Home.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  Splash.route: (context) => Splash(),
  Login.route: (context) => Login(),
  Register.route: (context) => Register(),
  Home.route: (context) => Home(),
  // Task.route: (context) => Task(),
  // Search.route: (context) => Search(),
  // ProductDetails.route: (context) => ProductDetails(),
  // CartDetails.route: (context) => CartDetails(),
  // EditProfile.route: (context) => EditProfile(),
  // Address.route: (context) => Address(),
};
