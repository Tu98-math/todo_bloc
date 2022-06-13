import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/todo_list/todo_list_bloc.dart';
import '/utils/dialogs/edit_dialog.dart';
import '/models/todo_model.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(this.todo, {Key? key}) : super(key: key);

  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context.read<TodoListBloc>().add(ToggleTodoEvent(id: widget.todo.id));
        },
      ),
      title: InkWell(
        onTap: () => showEditDialog(context, widget.todo),
        child: Text(widget.todo.desc ?? ''),
      ),
    );
  }
}
