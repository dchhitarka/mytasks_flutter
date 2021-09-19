import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_tasks/constants.dart';
import 'package:my_tasks/dio.dart';
import 'package:my_tasks/models/User.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/options.dart' as Opt;

class Auth with ChangeNotifier {
  User user;

  // get user {
  //   return _user;
  // }

  Future<Map<String, String>> getUser() async {
    try {
      // return ;
      // var user = _auth.currentUser;
      // var userData =
      // (await _store.collection('users').doc(user.uid).get()).data();
      // if (user.displayName == null)
      //   await user.updateDisplayName(userData['displayName']);
      // _user = UserModel.User({
      //   'displayName': userData['displayName'],
      //   'email': user.email,
      //   'phoneNumber': userData['phoneNumber'],
      //   'address': userData['address'],
      //   'uid': user.uid,
      // });
      return {'status': 'success', 'msg': 'Welcome Back!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Unable to proceed! Try Again.'};
    }
  }

  login(String email, String password) async {
    try {
      var res = await Dio().post(kBaseURL + "login",
          data: {"email": email, "password": password});
      var userData = jsonDecode(res.toString());
      var fsc = FlutterSecureStorage();
      fsc.write(key: 'token', value: userData["token"]);
      // fsc.write(key: 'id', value: userData["data"]["id"]);
      user = User({
        'username': userData["data"]["username"],
        'email': userData["data"]["email"],
        'id': userData["data"]["id"],
        'token': userData["token"],
      });
      print(user.id);
      // notifyListeners();
      return {'status': 'success', 'msg': 'Login successful!'};
    } catch (err) {
      print(err);
      return {'status': 'error', 'msg': 'Unable to Login! Try Again.'};
    }
  }

  Future<Map<String, String>> register(Map data) async {
    try {
      var res = await Dio().post(kBaseURL + "register", data: data);
      var userData = jsonDecode(res.toString());
      print(userData);
      var fsc = FlutterSecureStorage();
      fsc.write(key: 'token', value: userData["token"]);
      return {'status': 'success', 'msg': 'Registration successful!'};
    } catch (err) {
      print(err.toString());
      return {'status': 'error', 'msg': 'Unable to register!'};
    }
  }

  logout() async {
    try {
      var dio = await getApiClient();
      var res =
          await dio.request("user/logout", options: Opt.Options(method: 'GET'));
      var fsc = FlutterSecureStorage();
      fsc.deleteAll();
      return {'status': 'success', 'msg': 'Logged out!'};
    } catch (err) {
      print(err);
      return {'status': 'error', 'msg': err.toString()};
    }
  }
  // Future<Map<String, String>> updateUserData(Map data) async {
  //   try {
  //     await _store
  //         .collection('users')
  //         .doc(_user.uid)
  //         .update({'phoneNumber': data['mobile'], 'displayName': data['name']});
  //     _user.displayName = data['name'];
  //     _user.phoneNumber = data['mobile'];
  //     return {'status': 'success', 'msg': 'Your profile has been updated!'};
  //   } catch (err) {
  //     print(err);
  //     return {'status': 'error', 'msg': err.toString()};
  //   }
  // }
}
