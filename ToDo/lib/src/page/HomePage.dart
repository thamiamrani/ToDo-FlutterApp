import 'package:ToDo/src/page/HeaderHomePage.dart';
import 'package:ToDo/src/widget/ToDoPlaylistBand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
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
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 130,
            child: ToDoPlaylistBand(
              toDoPlaylistItems: [],
            ),
          ),
        ],
      ),
    );
  }
}
