import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteContainer,
  });

  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteContainer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteContainer,
              backgroundColor: const Color.fromARGB(255, 215, 12, 12),
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(taskName),
            ],
          ),
        ),
      ),
    );
  }
}
