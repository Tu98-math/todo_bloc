import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/todo_filter/todo_filter_bloc.dart';
import '/models/todo_model.dart';

class FilterTodo extends StatelessWidget {
  const FilterTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        filterButton(context, Filter.all),
        filterButton(context, Filter.active),
        filterButton(context, Filter.completed),
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context
            .read<TodoFilterBloc>()
            .add(ChangeFilterEvent(newFilter: filter));
      },
      child: Text(
        capitalize(filter.name),
        style: TextStyle(
          fontSize: 18.0,
          color: textColor(context, filter),
        ),
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Color textColor(BuildContext context, Filter filter) {
    if (filter == context.watch<TodoFilterBloc>().state.filter) {
      return Colors.blueAccent;
    }
    return Colors.grey;
  }
}
