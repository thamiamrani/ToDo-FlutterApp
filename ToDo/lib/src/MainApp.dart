import 'package:ToDo/src/page/HomePage.dart';
import 'package:ToDo/src/routing/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case Routes.home:
            return MaterialPageRoute(builder: (_) => HomePage());
          default:
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
    );
  }
}
