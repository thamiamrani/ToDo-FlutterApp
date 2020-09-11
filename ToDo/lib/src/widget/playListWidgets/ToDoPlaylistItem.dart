import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToDoPlaylistItem extends StatelessWidget {
  final String listName;
  final String imageUrl;
  final void Function() onTap;
  final void Function() onLongPress;
  final void Function() onDoubleTap;

  const ToDoPlaylistItem({
    @required this.listName,
    @required this.imageUrl,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: Container(
        width: 132,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      this.imageUrl,
                    ),
                  ),
                ),
                Text(listName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
