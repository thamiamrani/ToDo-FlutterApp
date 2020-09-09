import 'package:ToDo/src/model/TaskModel.dart';
import 'package:ToDo/src/model/TaskPlaylistModel.dart';
import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier {
  Map<String, TaskPlaylistModel> taskPlaylistsModels;

  AppModel() {
    taskPlaylistsModels = {"current": TaskPlaylistModel("current", [])};
  }

  AppModel.fromJson(Map<String, dynamic> json) {
    taskPlaylistsModels = {};

    List<String> playlistNames = json["app"].keys.toList();

    playlistNames.forEach((playlistName) => taskPlaylistsModels[playlistName] =
        TaskPlaylistModel.fromJson(json["app"][playlistName]));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {"app": {}};

    taskPlaylistsModels.values
        .forEach((value) => json["app"][value.playlistName] = value.toJson());

    return json;
  }

  void addTaskToPlaylist(String playlistName, Task task) {
    taskPlaylistsModels[playlistName].addTask(task);

    notifyListeners();
  }

  void deleteTaskFromPlaylist(String playlistName, Task task) {
    taskPlaylistsModels[playlistName].deleteTask(task);

    notifyListeners();
  }

  List<Task> getPlaylistTasks(String playlistName) =>
      taskPlaylistsModels[playlistName].getOrderedTasks();

  void modifyTaskOfPlaylistStatus(String playlistName, Task task) {
    taskPlaylistsModels[playlistName].modifyTaskStatus(task);

    notifyListeners();
  }

  int getRemainingNumberOfTask(String playlistName) {
    return taskPlaylistsModels[playlistName].getRemainingUnDoneTask();
  }

  void createPlaylist(String playlistName) {
    taskPlaylistsModels[playlistName] = TaskPlaylistModel(playlistName, []);
  }

  void deletePlaytlist(String playlistName) {
    taskPlaylistsModels.remove(playlistName);

    notifyListeners();
  }

  List<String> getPlaylistNames() {
    List<String> names = taskPlaylistsModels.keys.toList();
    names.removeWhere((element) => element == "current");
    return names;
  }

  void transferListToCurrent(String playlistName) {
    List<Task> taskFromPlaylist = new List<Task>.from(
        taskPlaylistsModels[playlistName].getOrderedTasks());

    taskFromPlaylist.forEach((task) {
      addTaskToPlaylist("current", task);
    });

    notifyListeners();
  }
}
