import 'package:flutter/material.dart';
import 'package:my_tasks/actions/item.dart';
import 'package:provider/provider.dart';

class Task extends StatefulWidget {
  static final route = '/task';
  final Map task;

  Task(this.task);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  var _items;
  var fetched = false;

  _getItems() async {
    if (!fetched) {
      await _items.getItems(widget.task["id"]);
      fetched = true;
      setState(() {});
    }
  }

  @override
  initState() {
    _getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _items = Provider.of<Item>(context);
    _getItems();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task["title"]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => addItem(context),
      ),
      body: _items.items.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.deepOrange,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (_) {
                  _items.removeItem(_items.items[index], widget.task["id"]);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Item deleted')));
                },
                child: ListTile(
                  title: Text(
                    _items.items[index]["title"],
                    style: _items.items[index]["status"]
                        ? const TextStyle(
                            color: Colors.red,
                            fontSize: 24.0,
                            decoration: TextDecoration.lineThrough,
                          )
                        : const TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      _items.removeItem(_items.items[index], widget.task["id"]);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Item deleted')));
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  leading: Checkbox(
                    value: _items.items[index]["status"],
                    onChanged: (newValue) {
                      var newItem = {
                        "status": newValue,
                        "id": _items.items[index]["id"]
                      };
                      _items.editItem(newItem, widget.task["id"]);
                    },
                  ),
                ),
              ),
              itemCount: _items.items.length,
            )
          : Center(
              child: Text(
                'No item available',
                style: TextStyle(
                  fontSize: 26.0,
                ),
              ),
            ),
    );
  }

  addItem(context) async {
    var _textFieldController = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new item'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                // var task = TaskModel.Task(_textFieldController.text)
                _items.addItem(_textFieldController.text, widget.task["id"]);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
