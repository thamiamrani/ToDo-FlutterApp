import 'package:ToDo/src/model/TaskModel.dart';
import 'package:flutter/cupertino.dart';

class TaskPlaylistModel extends ChangeNotifier {
  String playlistName;
  List<Task> tasks;

  TaskPlaylistModel(this.playlistName, this.tasks);

  TaskPlaylistModel.empty();

  TaskPlaylistModel.fromJson(Map<String, dynamic> json) {
    playlistName = json.keys.first;
    tasks = [];

    json[playlistName]
        .forEach((taskAsJson) => tasks.add(Task.fromJson(taskAsJson)));
  }

  Map<String, dynamic> toJson() =>
      {playlistName: tasks.map((task) => task.toJson()).toList()};

  void addTask(Task task) {
    tasks.add(task);

    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.removeWhere((element) => element.equal(task));

    notifyListeners();
  }

  String getPlaylistName() => playlistName;

  void setPlaylistName(String playlistName) {
    this.playlistName = playlistName;

    notifyListeners();
  }

  void modifyTaskStatus(Task task) {
    Task taskToModify = tasks.firstWhere((element) => element.equal(task));

    taskToModify.modifyTaskStatus();

    notifyListeners();
  }

  int getRemainingUnDoneTask() {
    return tasks.fold(
        0,
        (previousValue, element) =>
            element.done ? previousValue : previousValue += 1);
  }
}
