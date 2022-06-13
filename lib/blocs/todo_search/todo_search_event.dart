part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends TodoSearchEvent {
  final String newSearchTerm;

  const SetSearchTermEvent({required this.newSearchTerm});

  SetSearchTermEvent copyWith({
    String? newSearchTerm,
  }) {
    return SetSearchTermEvent(
      newSearchTerm: newSearchTerm ?? this.newSearchTerm,
    );
  }

  @override
  List<Object> get props => [newSearchTerm];
}
