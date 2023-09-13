import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/dialog_box.dart';
import 'package:to_do_app/widgets/todo_tile.dart';
import 'package:to_do_app/data/todo_list.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  checkedBox(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void savedNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: savedNewTask,
        onCancel: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('To Do'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (
          context,
          index,
        ) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            isCompleted: db.todoList[index][1],
            onChanged: (value) => checkedBox(value, index),
            deleteContainer: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
