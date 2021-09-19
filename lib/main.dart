import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tasks/screens/Login.dart';
import 'package:my_tasks/screens/Splash.dart';
import 'package:provider/provider.dart';

import 'package:my_tasks/constants.dart';
import 'package:my_tasks/providers.dart';
import 'package:my_tasks/helper/createMaterialColor.dart';
import 'package:my_tasks/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  runApp(MyTasks());
}

class MyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        title: 'MyTasks',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: createMaterialColor(kBgColor),
        ),
        initialRoute: Splash.route,
        routes: routes,
      ),
    );
  }
}
