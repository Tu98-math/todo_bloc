import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/models/todo_model.dart';

Future<void> showEditDialog(BuildContext context, Todo todo) {
  TextEditingController editController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Widget okButton = TextButton(
    child: const Text("YES"),
    onPressed: () {
      if (formKey.currentState!.validate()) {
        context
            .read<TodoListBloc>()
            .add(EditTodoEvent(id: todo.id, todoDesc: editController.text));
        Navigator.pop(context);
      }
    },
  );

  Widget noButton = TextButton(
    child: const Text("NO"),
    onPressed: () => Navigator.pop(context),
  );

  Widget alert = StatefulBuilder(
    builder: (context, setState) => AlertDialog(
      title: const Text("Are you sure?"),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: editController..text = todo.desc ?? '',
          validator: (String? valid) {
            if ((valid ?? '').trim() == '') {
              return 'Enter your todo';
            }
            return null;
          },
        ),
      ),
      actions: [
        noButton,
        okButton,
      ],
    ),
  );
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
