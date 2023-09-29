import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/fomulir_field.dart';
import 'package:todo_list/widgets/todo_content.dart';

class TodoNotifier extends ChangeNotifier {
  final _indexTodo = -1;
  Todo todo = Todo();
  final List<Todo> _list = [];

  // Controller for the text field
  List<Todo> get list => _list;
  int get indexTodo => _indexTodo;
  set indexTodo(int value) {
    indexTodo = value;
    notifyListeners();
  }

  // Function of Create, Read, Update, Delete (CRUD)

  void create(Todo todo) {
    _list.add(todo);
    notifyListeners();
    titleController.clear();
    shortDescriptionController.clear();
  }

  void updateTodo(Todo todo) {
    final index = _list.indexWhere((element) => element.id == todo.id);
    if (index != 1) {
      _list[index] = todo;
      notifyListeners();
    }
    notifyListeners();
  }

  void delete(Todo todo) {
    _list.removeWhere((element) => element.id == todo.id);
    notifyListeners();
  }

  Widget buildContent(Todo todo) {
    return Container(
        margin: const EdgeInsets.only(top: 16), child: TodoContent(todo: todo));
  }

  //

  List<Widget> getItems() {
    final List<Widget> listWidget = [];
    for (Todo element in _list) {
      listWidget.add(buildContent(element));
    }
    return listWidget;
  }
}

final todoNotifierProvider = ChangeNotifierProvider((ref) => TodoNotifier());
