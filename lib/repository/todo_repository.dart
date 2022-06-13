import 'package:todo_cubit_listener/models/todo_model.dart';

import '/dao/todo_dao.dart';

import '/database/database.dart';

class TodoRepository {
  late final TodoDao todoDao;

  initDatabase() async {
    AppDatabase database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    todoDao = database.todoDao;
  }

  Future<List<Todo>?> getAllTodo() {
    return todoDao.getAllTodo();
  }

  Future<void> removeTodo(Todo todo) async {
    await todoDao.deleteTodo(todo);
  }

  Future<void> insertTask(Todo todo) async {
    await todoDao.insertTodo(todo.id, todo.desc ?? '', todo.completed ?? true);
  }

  Future<void> updateTodo(Todo todo) async {
    await todoDao.updateTodo(todo);
  }
}
