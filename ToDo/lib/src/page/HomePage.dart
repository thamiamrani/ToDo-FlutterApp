import 'package:ToDo/src/model/AppModel.dart';
import 'package:ToDo/src/page/HeaderHomePage.dart';
import 'package:ToDo/src/repository/AppRepository.dart';
import 'package:ToDo/src/widget/ToDo/CreatePlaylistDialog.dart';
import 'package:ToDo/src/widget/ToDo/ToDoList.dart';
import 'package:ToDo/src/widget/ToDo/ToDoListView.dart';
import 'package:ToDo/src/widget/playListWidgets/ToDoPlaylistBand.dart';
import 'package:ToDo/src/widget/playListWidgets/ToDoPlaylistItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final SharedPreferencesAppRepository appRepository;

  const HomePage({@required this.appRepository});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String CURRENT_PLAYLISTNAME = "current";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderHomePage(
            tasksLeft: Provider.of<AppModel>(
              context,
              listen: true,
            ).getRemainingNumberOfTask(CURRENT_PLAYLISTNAME),
          ),
          const SizedBox(height: 10),
          _buildPlayListBand(),
          const SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  child: _buildBottomCircle(),
                ),
                Center(
                  child: ToDoList(
                    appRepository: this.widget.appRepository,
                    playListName: CURRENT_PLAYLISTNAME,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayListBand() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 125,
      child: ToDoPlaylistBand(
        toDoPlaylistItems: [
          CreatePlaylistDialog(
            appRepository: this.widget.appRepository,
            onCreate: (value) {
              Provider.of<AppModel>(context, listen: false)
                  .createPlaylist(value);

              save(context);
            },
            child: ToDoPlaylistItem(
              listName: "Créer une playlist",
              imageUrl: "assets/images/add.svg",
            ),
          ),
          ...Provider.of<AppModel>(context, listen: true)
              .getPlaylistNames()
              .map((name) {
            return ToDoPlaylistItem(
                listName: name,
                imageUrl: "assets/images/list.svg",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext builderContext) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: ToDoListView(
                          appRepository: this.widget.appRepository,
                          playlistName: name,
                        ),
                      );
                    },
                  );
                },
                onDoubleTap: () {
                  Provider.of<AppModel>(context, listen: false)
                      .transferListToCurrent(name);

                  save(context);
                },
                onLongPress: () {
                  Provider.of<AppModel>(context, listen: false)
                      .deletePlaytlist(name);

                  save(context);
                });
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildBottomCircle() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.42,
      decoration: BoxDecoration(
        color: Color(0xFFffd599),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(230),
        ),
      ),
    );
  }

  void save(BuildContext context) {
    this.widget.appRepository.saveAppModel(
          Provider.of<AppModel>(
            context,
            listen: false,
          ),
        );
  }
}
