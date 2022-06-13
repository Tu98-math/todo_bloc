import 'package:flutter/material.dart';

import '/utils/widgets/create_todo.dart';
import '/utils/widgets/filter_todo.dart';
import '/utils/widgets/search_todo.dart';
import '/utils/widgets/show_todos.dart';
import '/utils/widgets/todo_header.dart';

class ToDosPages extends StatelessWidget {
  const ToDosPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                buildHeader(context),
                buildCreateTodo(context),
                const SizedBox(height: 10),
                buildSearchTodo(context),
                buildFilterTodo(context),
                buildShowTodos(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => const TodoHeader();

  Widget buildCreateTodo(BuildContext context) => const CreateTodo();

  Widget buildSearchTodo(BuildContext context) => const SearchTodo();

  Widget buildFilterTodo(BuildContext context) => const FilterTodo();

  Widget buildShowTodos(BuildContext context) => const ShowTodos();
}
