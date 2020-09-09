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
  final String playListName;

  const ToDoList({
    @required this.appRepository,
    @required this.playListName,
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
                  if (value.isNotEmpty) {
                    Provider.of<AppModel>(context, listen: false)
                        .addTaskToPlaylist(
                      playListName,
                      Task(
                        description: value,
                        done: false,
                      ),
                    );
                    save(context);
                  }
                  FocusScope.of(context).unfocus();
                },
              ),
              Expanded(
                child: ListView(
                  children: Provider.of<AppModel>(context, listen: true)
                      .getPlaylistTasks(playListName)
                      .map(
                        (task) => ToDoListItem(
                          task: task,
                          onClick: () {
                            Provider.of<AppModel>(context, listen: false)
                                .modifyTaskOfPlaylistStatus(playListName, task);

                            save(context);
                          },
                          onLongPress: () {
                            Provider.of<AppModel>(context, listen: false)
                                .deleteTaskFromPlaylist(playListName, task);

                            save(context);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void save(BuildContext context) {
    appRepository.saveAppModel(
      Provider.of<AppModel>(
        context,
        listen: false,
      ),
    );
  }
}
