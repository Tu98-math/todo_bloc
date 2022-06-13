import 'package:floor/floor.dart';

import '/models/todo_model.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM Todo')
  Future<List<Todo>?> getAllTodo();

  @Query(
      'INSERT INTO Todo (id, desc, completed) VALUES (:id, :desc, :completed)')
  Future<void> insertTodo(String id, String desc, bool completed);

  @update
  Future<void> updateTodo(Todo todo);

  @delete
  Future<void> deleteTodo(Todo todo);

  @Query('DELETE FROM Todo')
  Future<void> deleteTable();
}
