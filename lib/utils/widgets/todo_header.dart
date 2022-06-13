import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final int activeCount = state.todos
                .where((Todo todoElement) => !(todoElement.completed ?? true))
                .toList()
                .length;
            context
                .read<ActiveTodoCountBloc>()
                .add(CalculateActiveTodoCount(activeTodoCount: activeCount));
          },
          child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
            builder: (context, state) {
              return Text(
                "${state.activeTodoCount} item${state.activeTodoCount > 1 ? "s" : ""} left",
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
