part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  final todoRepository = TodoRepository();

  TodoListState({
    required this.todos,
  }) {
    initDatabase();
  }

  initDatabase() async {
    await todoRepository.initDatabase();
  }

  @override
  List<Object> get props => [todos];

  factory TodoListState.initial() {
    return TodoListState(
      todos: const [],
    );
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  String toString() => 'TodoListState(todos: $todos)';
}
