part of 'todo_search_bloc.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;
  const TodoSearchState({required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }

  TodoSearchState copyWith({
    String? searchItem,
  }) {
    return TodoSearchState(
      searchTerm: searchItem ?? searchTerm,
    );
  }

  @override
  String toString() => 'TodoSearchState(searchItem: $searchTerm)';
}
