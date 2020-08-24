import 'dart:convert';
import 'package:ToDo/src/model/AppModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAppRepository {
  static const String APP_KEY = "app";

  Future<SharedPreferences> Function() getSharedPreferences;

  SharedPreferencesAppRepository({this.getSharedPreferences});

  Future<AppModel> getAppModel() async {
    SharedPreferences sharedPreferences = await getSharedPreferences();
    String modelAsString = sharedPreferences.getString(APP_KEY);
    if (modelAsString == null) {
      return AppModel();
    }
    Map<String, dynamic> data =
        json.decode(modelAsString) as Map<String, dynamic>;
    return AppModel.fromJson(data);
  }

  Future<void> saveAppModel(AppModel appModel) async {
    SharedPreferences sharedPreferences = await getSharedPreferences();
    await sharedPreferences.setString(
      APP_KEY,
      json.encode(
        appModel.toJson(),
      ),
    );
  }
}
