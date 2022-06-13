// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/repository/todo_repository.dart';
import '/models/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final _todoRepository = TodoRepository();

  TodoListBloc() : super(TodoListState.initial()) {
    _initDatabase();

    on<AddTodoEvent>(_addTodo);

    on<EditTodoEvent>(_editTodo);

    on<ToggleTodoEvent>(_toggleTodo);

    on<RemoveTodoEvent>(_removeTodo);
  }

  _initDatabase() async {
    await _todoRepository.initDatabase();
    List<Todo>? newTodos = await _todoRepository.getAllTodo();
    if (newTodos != null) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(todos: newTodos));
    }
  }

  _addTodo(AddTodoEvent event, Emitter<TodoListState> emit) {
    final Todo newTodo = Todo(desc: event.todoDesc);
    final List<Todo> newTodos = [...state.todos, newTodo];
    _todoRepository.insertTask(newTodo);
    emit(state.copyWith(todos: newTodos));
  }

  _editTodo(EditTodoEvent event, Emitter<TodoListState> emit) {
    final List<Todo> newTodos = state.todos.map((Todo elementTodo) {
      if (elementTodo.id == event.id) {
        Todo newTodo = Todo(
          id: event.id,
          desc: event.todoDesc,
          completed: elementTodo.completed,
        );
        _todoRepository.updateTodo(newTodo);
        return newTodo;
      }
      return elementTodo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  _toggleTodo(ToggleTodoEvent event, Emitter<TodoListState> emit) {
    final List<Todo> newTodos = state.todos.map((Todo elementTodo) {
      if (elementTodo.id == event.id) {
        Todo newTodo = Todo(
          id: elementTodo.id,
          desc: elementTodo.desc,
          completed: !(elementTodo.completed ?? true),
        );
        _todoRepository.updateTodo(newTodo);
        return newTodo;
      }
      return elementTodo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  _removeTodo(RemoveTodoEvent event, Emitter<TodoListState> emit) {
    _todoRepository.removeTodo(event.todo);
    final List<Todo> newTodos = state.todos
        .where((Todo elementTodo) => elementTodo.id != event.todo.id)
        .toList();
    emit(state.copyWith(todos: newTodos));
  }
}
