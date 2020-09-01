import 'package:ToDo/src/model/AppModel.dart';
import 'package:ToDo/src/page/HeaderHomePage.dart';
import 'package:ToDo/src/repository/AppRepository.dart';
import 'package:ToDo/src/widget/ToDo/ToDoList.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderHomePage(
            tasksLeft: 0,
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
                    tasks: Provider.of<AppModel>(context, listen: false)
                        .getCurrentTasks(),
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
          ToDoPlaylistItem(
            listName: "Créer une playlist",
            imageUrl: "assets/images/add.svg",
            onCLick: () {
              print("ok");
            },
          ),
          ToDoPlaylistItem(
            listName: "Playlist 1",
            imageUrl: "assets/images/list.svg",
            onCLick: () {
              print("ok123");
            },
          ),
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
}
