import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ToDoPlaylistBand extends StatelessWidget {
  final List<Widget> toDoPlaylistItems;

  ToDoPlaylistBand({
    @required this.toDoPlaylistItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: toDoPlaylistItems,
    );
  }
}
