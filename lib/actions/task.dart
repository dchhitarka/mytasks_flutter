import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/dio.dart';

import '../constants.dart';

class Task with ChangeNotifier {
  // int cartLength = 0;
  List tasks = [];

  getTasks() async {
    try {
      var dio = await getApiClient();
      var res = await dio.request("tasks/", options: Options(method: 'GET'));
      var data = res.data as List;
      tasks = data;
      notifyListeners();
      return {'status': 'success', 'msg': 'Done!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Something went wrong! Try Again.'};
    }
  }

  addTask(task) async {
    try {
      var dio = await getApiClient();
      var res = await dio.request("tasks/",
          data: {"title": task}, options: Options(method: 'POST'));
      // print(res.toString());
      // notifyListeners();
      this.getTasks();
      return {'status': 'success', 'msg': 'Task added!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Something went wrong! Try Again.'};
    }
  }

  updateTask(task) async {
    try {
      var dio = await getApiClient();
      var res = await dio.request("tasks/${task.id}",
          data: task.toJSON(), options: Options(method: 'PUT'));
      // print(res.data);
      this.getTasks();
      notifyListeners();
      return {'status': 'success', 'msg': 'Task updated!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Something went wrong! Try Again.'};
    }
  }

  deleteTask(task) async {
    try {
      var dio = await getApiClient();
      var res =
          await dio.request("tasks/$task", options: Options(method: 'DELETE'));
      this.getTasks();
      notifyListeners();
      return {'status': 'success', 'msg': 'Task deleted!'};
    } catch (err) {
      return {'status': 'error', 'msg': 'Something went wrong! Try Again.'};
    }
  }
}
