import 'package:ToDo/src/model/TaskPlaylistModel.dart';
import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier {
  List<TaskPlaylistModel> taskPlaylistsModels;

  AppModel() {
    taskPlaylistsModels = [TaskPlaylistModel.empty()];
  }

  AppModel.fromJson(Map<String, Map<String, dynamic>> json) {
    List<String> playlistNames = json["app"].keys;
    taskPlaylistsModels = playlistNames
        .map((playlistName) =>
            TaskPlaylistModel.fromJson(json["app"][playlistName]))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        "app": {
          ...taskPlaylistsModels.map((value) => value.toJson()).toList(),
        }
      };
}
