import 'package:my_tasks/actions/auth.dart';
import 'package:my_tasks/actions/task.dart';
import 'package:my_tasks/actions/item.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (ctx) => Auth()),
    ChangeNotifierProvider(create: (ctx) => Task()),
    ChangeNotifierProvider(create: (ctx) => Item()),
  ];
}
