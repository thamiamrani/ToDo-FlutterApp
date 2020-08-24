import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToDoPlaylistItem extends StatelessWidget {
  final String listName;
  final String imageUrl;
  final void Function() onCLick;

  const ToDoPlaylistItem({
    @required this.listName,
    @required this.imageUrl,
    @required this.onCLick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCLick,
      child: Container(
        width: 132,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 10,
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
