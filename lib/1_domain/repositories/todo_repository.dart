import 'package:either_dart/either.dart';
import 'package:flutter_clean_architecture_2/1_domain/entities/todo_collection.dart';
import 'package:flutter_clean_architecture_2/1_domain/failures/failures.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections();
}
