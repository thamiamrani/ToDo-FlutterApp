import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskInput extends StatefulWidget {
  final void Function(String) onAdd;

  const AddTaskInput({this.onAdd});

  @override
  _AddTaskInputState createState() => _AddTaskInputState();
}

class _AddTaskInputState extends State<AddTaskInput> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: "Ajouter une tâche"),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            widget.onAdd(textEditingController.value.text);
            textEditingController.clear();
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ],
    );
  }
}
