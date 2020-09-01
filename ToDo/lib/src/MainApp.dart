import 'package:ToDo/src/page/HomePage.dart';
import 'package:ToDo/src/repository/AppRepository.dart';
import 'package:ToDo/src/routing/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final SharedPreferencesAppRepository appRepository;

  MainApp({
    @required this.appRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case Routes.home:
            return MaterialPageRoute(
              builder: (_) => HomePage(
                appRepository: appRepository,
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => HomePage(
                appRepository: appRepository,
              ),
            );
        }
      },
    );
  }
}
