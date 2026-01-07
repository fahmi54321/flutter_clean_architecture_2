import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2/0_data/repositories/todo_collection_repository_mock.dart';
import 'package:flutter_clean_architecture_2/1_domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture_2/2_application/app/basic_app.dart';

void main() {
  runApp(
    RepositoryProvider<ToDoRepository>(
      create: (context) => ToDoRepositoryMock(),
      child: const BasicApp(),
    ),
  );
}
