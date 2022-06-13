part of 'active_todo_count_bloc.dart';

abstract class ActiveTodoCountEvent extends Equatable {
  const ActiveTodoCountEvent();

  @override
  List<Object> get props => [];
}

class CalculateActiveTodoCount extends ActiveTodoCountEvent {
  final int activeTodoCount;

  const CalculateActiveTodoCount({
    required this.activeTodoCount,
  });

  CalculateActiveTodoCount copyWith({
    int? activeTodoCount,
  }) {
    return CalculateActiveTodoCount(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }

  @override
  List<Object> get props => [activeTodoCount];
}
