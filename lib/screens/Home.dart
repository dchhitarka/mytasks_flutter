import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/actions/auth.dart';
import 'package:my_tasks/actions/task.dart';
import 'package:my_tasks/screens/Login.dart';
import 'package:my_tasks/screens/Task.dart' as TaskScreen;
// import 'package:my_tasks/models/Task.dart' as TaskModel;
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static final route = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _auth;
  var _task;
  var fetched = false;
  @override
  initState() {
    _getTasks();
    super.initState();
  }

  _getTasks() async {
    if (!fetched) {
      await _task.getTasks();
      fetched = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<Auth>(context);
    _task = Provider.of<Task>(context);
    _getTasks();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Tasks",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  var res = await _auth.logout();
                  // if (res['status'] == "success") {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Login.route, (route) => false);
                  // }
                }),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_task.tasks != null && _task.tasks.length > 0)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: _task?.tasks?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(1.0),
                        // leading: Icon(Icons.list),
                        title: GestureDetector(
                          child: Text(
                            _task?.tasks[index]["title"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TaskScreen.Task(_task?.tasks[index])));
                          },
                        ),
                        trailing: SizedBox(
                          width: 50.0,
                          child: Row(
                            children: [
                              // Padding(
                              //   padding: EdgeInsets.only(right: 2.0),
                              //   child: Icon(Icons.edit),
                              // ),
                              IconButton(
                                icon: Icon(Icons.delete_outline,
                                    color: Colors.red),
                                onPressed: () =>
                                    _task.deleteTask(_task.tasks[index]["id"]),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                if (_task.tasks != null && _task.tasks.length == 0)
                  Text('No task available!'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Task',
        child: Icon(Icons.add),
        onPressed: () => addTask(context),
      ),
    );
  }

  addTask(context) async {
    var _textFieldController = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new task'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new task'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                // var task = TaskModel.Task(_textFieldController.text)
                Navigator.of(context).pop();
                _task.addTask(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
