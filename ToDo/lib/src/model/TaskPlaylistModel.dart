import 'package:ToDo/src/model/TaskModel.dart';
import 'package:flutter/cupertino.dart';

class TaskPlaylistModel extends ChangeNotifier {
  String playlistName;
  List<Task> tasks;

  TaskPlaylistModel(this.playlistName, this.tasks);

  TaskPlaylistModel.empty();

  TaskPlaylistModel.fromJson(Map<String, dynamic> json) {
    json[json.keys.first]
        .map((taskAsJson) => Task.fromJson(taskAsJson))
        .forEach((task) {
      this.tasks.add(task);
    });
  }

  Map<String, dynamic> toJson() =>
      {playlistName: tasks.map((tasks) => (task) => task.toJson()).toList()};

  void setPlaylistName(String playlistName) {
    this.playlistName = playlistName;

    notifyListeners();
  }
}
