import 'package:ToDo/src/repository/AppRepository.dart';
import 'package:ToDo/src/widget/ToDo/ToDoListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePlaylistDialog extends StatefulWidget {
  final SharedPreferencesAppRepository appRepository;
  final void Function(String) onCreate;
  final Widget child;

  CreatePlaylistDialog({
    @required this.appRepository,
    @required this.onCreate,
    @required this.child,
  });

  @override
  _CreatePlaylistDialogState createState() => _CreatePlaylistDialogState();
}

class _CreatePlaylistDialogState extends State<CreatePlaylistDialog> {
  final TextEditingController textEditingController = TextEditingController();
  String _currentPlaylistName;

  @override
  void initState() {
    _currentPlaylistName = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPlayListNameDialog(context),
      child: AbsorbPointer(
        child: this.widget.child,
      ),
    );
  }

  void _showPlayListNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 160,
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Text("Nom de la playlist :"),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: textEditingController,
                ),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  color: Color(0xFF6994c6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {
                    if (textEditingController.value.text.isNotEmpty) {
                      this.widget.onCreate(textEditingController.value.text);
                      setState(() {
                        _currentPlaylistName = textEditingController.value.text;
                      });
                      Navigator.of(context).pop();
                      _showTaskListDialog(context);
                      textEditingController.clear();
                    }
                  },
                  child: Text(
                    "Suivant",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTaskListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: ToDoListView(
            appRepository: this.widget.appRepository,
            playlistName: _currentPlaylistName,
          ),
        );
      },
    );
  }
}
