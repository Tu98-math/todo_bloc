import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/utils/dialogs/remove_dialog.dart';
import '/models/todo_model.dart';

import 'todo_item.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = context.watch<FilteredTodosBloc>().state.filteredTodos;

    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            context.read<FilteredTodosBloc>().add(SetFilteredTodosEvent(
                  filter: context.read<TodoFilterBloc>().state.filter,
                  todos: state.todos,
                  searchTerm: context.read<TodoSearchBloc>().state.searchTerm,
                ));
          },
        ),
        BlocListener<TodoFilterBloc, TodoFilterState>(
          listener: (context, state) {
            context.read<FilteredTodosBloc>().add(SetFilteredTodosEvent(
                  filter: state.filter,
                  todos: context.read<TodoListBloc>().state.todos,
                  searchTerm: context.read<TodoSearchBloc>().state.searchTerm,
                ));
          },
        ),
        BlocListener<TodoSearchBloc, TodoSearchState>(
          listener: (context, state) {
            context.read<FilteredTodosBloc>().add(SetFilteredTodosEvent(
                  filter: context.read<TodoFilterBloc>().state.filter,
                  todos: context.read<TodoListBloc>().state.todos,
                  searchTerm: state.searchTerm,
                ));
          },
        ),
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            child: TodoItem(todos[index]),
            onDismissed: (_) {
              context
                  .read<TodoListBloc>()
                  .add(RemoveTodoEvent(todo: todos[index]));
            },
            confirmDismiss: (_) => showRemoveDialog(context),
          );
        },
        separatorBuilder: (_, __) {
          return const Divider(color: Colors.grey);
        },
        itemCount: todos.length,
      ),
    );
  }
}
