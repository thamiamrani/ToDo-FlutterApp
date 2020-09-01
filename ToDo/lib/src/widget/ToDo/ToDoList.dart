import 'package:ToDo/src/model/AppModel.dart';
import 'package:ToDo/src/model/TaskModel.dart';
import 'package:ToDo/src/repository/AppRepository.dart';
import 'package:ToDo/src/widget/ToDo/AddTaskInput.dart';
import 'package:ToDo/src/widget/ToDo/ToDoListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  final SharedPreferencesAppRepository appRepository;
  final List<Task> tasks;

  const ToDoList({
    @required this.appRepository,
    @required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.51,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              AddTaskInput(
                onAdd: (value) {
                  Provider.of<AppModel>(context, listen: false)
                      .addTaskToCurrent(
                    Task(
                      description: value,
                      done: false,
                    ),
                  );

                  appRepository.saveAppModel(Provider.of<AppModel>(
                    context,
                    listen: false,
                  ));
                },
              ),
              Expanded(
                child: ListView(
                  children: tasks
                      .map((task) => ToDoListItem(task: task, onClick: () {}))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
