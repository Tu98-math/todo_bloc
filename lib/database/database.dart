import 'dart:async';

import 'package:floor/floor.dart';

import '/dao/todo_dao.dart';
import '/models/todo_model.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
