import 'package:hive/hive.dart';

class ToDoDataBase {
  List todoList = [];

  void createInitialData() {
    todoList = [];
  }

  final _mybox = Hive.box('myBox');

  void loadData() {
    todoList = _mybox.get('TODOLIST');
  }

  void updateDataBase() {
    _mybox.put('TODOLIST', todoList);
  }
}
