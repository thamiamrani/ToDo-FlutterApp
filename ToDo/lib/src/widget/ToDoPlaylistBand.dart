import 'package:ToDo/src/widget/ToDoPlaylistItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ToDoPlaylistBand extends StatelessWidget {
  final List<ToDoPlaylistItem> toDoPlaylistItems;

  ToDoPlaylistBand({
    @required this.toDoPlaylistItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        ToDoPlaylistItem(
          listName: "Créer une playlist",
          imageUrl: "assets/images/add.svg",
          onCLick: () {
            print("ok");
          },
        ),
        ToDoPlaylistItem(
          listName: "Créer une playlist",
          imageUrl: "assets/images/list.svg",
          onCLick: () {
            print("ok123");
          },
        ),
        ToDoPlaylistItem(
          listName: "Créer une playlist",
          imageUrl: "assets/images/list.svg",
          onCLick: () {
            print("ok123");
          },
        ),
        ToDoPlaylistItem(
          listName: "Créer une playlist",
          imageUrl: "assets/images/list.svg",
          onCLick: () {
            print("ok123");
          },
        ),
        ToDoPlaylistItem(
          listName: "Créer une playlist",
          imageUrl: "assets/images/list.svg",
          onCLick: () {
            print("ok123");
          },
        ),
        ToDoPlaylistItem(
          listName: "Créer une playlist",
          imageUrl: "assets/images/list.svg",
          onCLick: () {
            print("ok123");
          },
        ),
      ],
    );
  }
}
