// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/models/todo_model.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final List<Todo> initialTodos;
  FilteredTodosBloc({required this.initialTodos})
      : super(FilteredTodosState(filteredTodos: initialTodos)) {
    on<SetFilteredTodosEvent>(
      (event, emit) {
        List<Todo> filteredTodos = [];

        switch (event.filter) {
          case Filter.active:
            filteredTodos = event.todos
                .where((Todo todo) => !(todo.completed ?? true))
                .toList();
            break;
          case Filter.completed:
            filteredTodos = event.todos
                .where((Todo todo) => (todo.completed ?? true))
                .toList();
            break;
          case Filter.all:
          default:
            filteredTodos = event.todos;
            break;
        }

        if (event.searchTerm.isNotEmpty) {
          filteredTodos = List<Todo>.from(filteredTodos)
              .where(
                (Todo todo) =>
                    (todo.desc ?? '').toLowerCase().contains(event.searchTerm),
              )
              .toList();
        }

        emit(state.copyWith(filteredTodos: filteredTodos));
      },
    );
  }
}
