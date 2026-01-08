import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2/0_data/data_sources/local/hive_local_data_source.dart';
import 'package:flutter_clean_architecture_2/0_data/data_sources/repositories/todo_repository_local.dart';
import 'package:flutter_clean_architecture_2/1_domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture_2/2_application/app/basic_app.dart';

Future<void> main() async {
  final localDataSource = HiveLocalDataSource();
  await localDataSource.init();

  runApp(
    RepositoryProvider<ToDoRepository>(
      create: (context) =>
          ToDoRepositoryLocal(localDataSource: localDataSource),
      child: const BasicApp(),
    ),
  );
}
