import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePlaylistDialog extends StatelessWidget {
  final Widget child;

  CreatePlaylistDialog({@required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTaskListDialog(context),
      child: AbsorbPointer(
        child: child,
      ),
    );
  }

  void _showPlayListDialog(BuildContext context) {
    
  }

  void _showTaskListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              children: [
                Text("okewofk"),
              ],
            ),
          ),
        );
      },
    );
  }
}
