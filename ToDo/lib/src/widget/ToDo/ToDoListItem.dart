import 'package:ToDo/src/model/TaskModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoListItem extends StatelessWidget {
  final Task task;
  final void Function() onClick;
  final void Function() onLongPress;

  const ToDoListItem(
      {@required this.task, @required this.onClick, @required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            _buildCheckIcon(),
            const SizedBox(width: 10),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckIcon() {
    return this.task.done
        ? Icon(Icons.check_box)
        : Icon(Icons.check_box_outline_blank);
  }

  Widget _buildDescription(BuildContext context) {
    return this.task.done
        ? _buildDescriptionText(
            context,
            TextStyle(
              color: Colors.grey.shade800,
              decoration: TextDecoration.lineThrough,
              fontSize: 18,
            ),
          )
        : _buildDescriptionText(
            context,
            TextStyle(fontSize: 18),
          );
  }

  Widget _buildDescriptionText(BuildContext context, TextStyle textStyle) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(
        task.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: textStyle,
      ),
    );
  }
}
