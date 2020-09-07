import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  DateTime date;
  String description;
  bool done;

  Task({this.description, this.done}) : this.date = DateTime.now();

  Task.fromJson(Map<String, dynamic> json)
      : date = DateTime.fromMillisecondsSinceEpoch(json["date"]),
        description = json["description"],
        done = json["done"];

  Map<String, dynamic> toJson() => {
        "date": date.millisecondsSinceEpoch,
        "description": description,
        "done": done,
      };

  void modifyTaskStatus() {
    done = !done;

    notifyListeners();
  }

  bool equal(Task task) {
    return task.description == description &&
        task.date == date &&
        task.done == done;
  }
}
