part of 'filtered_todos_bloc.dart';

abstract class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();

  @override
  List<Object> get props => [];
}

class SetFilteredTodosEvent extends FilteredTodosEvent {
  final Filter filter;
  final List<Todo> todos;
  final String searchTerm;

  const SetFilteredTodosEvent({
    required this.filter,
    required this.todos,
    required this.searchTerm,
  });

  SetFilteredTodosEvent copyWith({
    Filter? filter,
    List<Todo>? todos,
    String? searchTerm,
  }) {
    return SetFilteredTodosEvent(
      filter: filter ?? this.filter,
      todos: todos ?? this.todos,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  String toString() =>
      'SetFilteredTodos(filter: $filter, todos: $todos, searchTerm: $searchTerm)';

  @override
  List<Object> get props => [filter, todos, searchTerm];
}
