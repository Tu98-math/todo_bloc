import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_listener/blocs/todo_search/todo_search_bloc.dart';

class SearchTodo extends StatefulWidget {
  const SearchTodo({Key? key}) : super(key: key);

  @override
  State<SearchTodo> createState() => _SearchTodoState();
}

class _SearchTodoState extends State<SearchTodo> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        hintText: 'Search todos...',
        border: InputBorder.none,
        filled: true,
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (String? newSearchItem) {
        if (newSearchItem != null) {
          context.read<TodoSearchBloc>().add(
              SetSearchTermEvent(newSearchTerm: newSearchItem.toLowerCase()));
        }
      },
    );
  }
}
