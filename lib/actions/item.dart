import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/dio.dart';

import '../constants.dart';

class Item with ChangeNotifier {
  // int cartLength = 0;
  List items = [];

  getItems(task) async {
    try {
      var dio = await getApiClient();
      var res =
          await dio.request("tasks/$task", options: Options(method: 'GET'));
      var data = res.data as List;
      items = data;
      notifyListeners();
      return {'status': 'success', 'msg': 'Done!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Something went wrong! Try Again.'};
    }
  }

  addItem(item, task) async {
    try {
      var dio = await getApiClient();
      var res = await dio.request("tasks/$task",
          data: {"title": item}, options: Options(method: 'POST'));
      // print(res.toString());
      this.getItems(task);
      notifyListeners();
      return {'status': 'success', 'msg': 'Item added!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Something went wrong! Try Again.'};
    }
  }

  editItem(item, task) async {
    try {
      var dio = await getApiClient();
      var res = await dio.request("tasks/$task/${item["id"]}",
          data: item, options: Options(method: 'PUT'));
      // print(res.data);
      this.getItems(task);
      notifyListeners();
      return {'status': 'success', 'msg': 'Item updated!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Unable to Login! Try Again.'};
    }
  }

  removeItem(item, task) async {
    try {
      var dio = await getApiClient();
      var res = await dio.request("tasks/$task/${item["id"]}",
          data: item, options: Options(method: 'DELETE'));
      this.getItems(task);
      notifyListeners();
      return {'status': 'success', 'msg': 'Item deleted!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Unable to Login! Try Again.'};
    }
  }
}
