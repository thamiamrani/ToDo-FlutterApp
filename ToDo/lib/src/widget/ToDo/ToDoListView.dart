import 'package:ToDo/src/model/AppModel.dart';
import 'package:ToDo/src/model/TaskModel.dart';
import 'package:ToDo/src/repository/AppRepository.dart';
import 'package:ToDo/src/widget/ToDo/AddTaskInput.dart';
import 'package:ToDo/src/widget/ToDo/ToDoListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ToDoListView extends StatelessWidget {
  final SharedPreferencesAppRepository appRepository;
  final String playlistName;

  const ToDoListView({
    @required this.appRepository,
    @required this.playlistName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.71,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            playlistName,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          AddTaskInput(
            onAdd: (value) {
              if (value.isNotEmpty) {
                Provider.of<AppModel>(context, listen: false).addTaskToPlaylist(
                  playlistName,
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
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: ListView(
              children: Provider.of<AppModel>(context, listen: true)
                  .getPlaylistTasks(playlistName)
                  .map(
                    (task) => ToDoListItem(
                      task: task,
                      onClick: () {},
                      onLongPress: () {
                        Provider.of<AppModel>(context, listen: false)
                            .deleteTaskFromPlaylist(playlistName, task);

                        save(context);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
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
