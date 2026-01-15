import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2/0_data/data_sources/local/hive_local_data_source.dart';
import 'package:flutter_clean_architecture_2/0_data/data_sources/repositories/todo_repository_local.dart';
import 'package:flutter_clean_architecture_2/1_domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture_2/2_application/app/basic_app.dart';
import 'package:flutter_clean_architecture_2/2_application/app/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'apiKey',
      appId: 'appId',
      messagingSenderId: 'messagingSenderId',
      projectId: 'projectId',
    ),
  );

  final localDataSource = HiveLocalDataSource();
  await localDataSource.init();

  final authCubit = AuthCubit();

  FirebaseAuth.instance.authStateChanges().listen((user) {
    debugPrint('user: $user');
    authCubit.authStateChanged(user: user);
  });

  runApp(
    RepositoryProvider<ToDoRepository>(
      create: (context) =>
          ToDoRepositoryLocal(localDataSource: localDataSource),
      child: BlocProvider<AuthCubit>(
        create: (context) => authCubit,
        child: const BasicApp(),
      ),
    ),
  );
}
