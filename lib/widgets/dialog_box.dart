import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/my_buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 255, 239, 114),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: controller,
                cursorColor: Colors.black87,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButtons(
                  text: 'Save',
                  onPressed: onSave,
                ),
                MyButtons(
                  text: 'Cancel',
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
