import 'package:ToDo/src/model/TaskModel.dart';
import 'package:ToDo/src/model/TaskPlaylistModel.dart';
import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier {
  Map<String, TaskPlaylistModel> taskPlaylistsModels;

  AppModel() {
    taskPlaylistsModels = {"current": TaskPlaylistModel("current", [])};
  }

  AppModel.fromJson(Map<String, dynamic> json) {
    var playlistNames = json["app"].keys;

    playlistNames.map((playlistName) => taskPlaylistsModels[playlistName] =
        TaskPlaylistModel.fromJson(json["app"][playlistName]));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {"app": {}};
    taskPlaylistsModels.values
        .map((value) => json["app"][value.playlistName] = value.toJson());
    return json;
  }

  void addTaskToPlaylist(String playlistName, Task task) {
    taskPlaylistsModels[playlistName].addTask(task);

    notifyListeners();
  }

  void addTaskToCurrent(Task task) {
    taskPlaylistsModels["current"].addTask(task);

    notifyListeners();
  }

  List<Task> getCurrentTasks() => taskPlaylistsModels["current"].tasks;
}
