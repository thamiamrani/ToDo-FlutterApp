import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  final int tasksLeft;

  HeaderHomePage({this.tasksLeft});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.29,
          decoration: BoxDecoration(
            color: Color(0xFF6994c6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(230),
            ),
          ),
        ),
        Column(
          children: [
            _buildLabel(
              30,
              "Bonjour Junko,",
              const EdgeInsets.fromLTRB(10, 55, 0, 0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            _buildLabel(
              19,
              "Tâches à faire : $tasksLeft",
              const EdgeInsets.only(left: 10),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildLabel(double fontSize, String label, EdgeInsets padding) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: padding,
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }
}
