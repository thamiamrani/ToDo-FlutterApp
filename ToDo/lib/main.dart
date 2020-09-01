import 'package:ToDo/src/MainApp.dart';
import 'package:ToDo/src/model/AppModel.dart';
import 'package:ToDo/src/repository/AppRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferencesAppRepository appRepository = SharedPreferencesAppRepository(
      getSharedPreferences: SharedPreferences.getInstance);

  AppModel appModel = await appRepository.getAppModel();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => appModel,
        ),
      ],
      child: MainApp(
        appRepository: appRepository,
      ),
    ),
  );
}
