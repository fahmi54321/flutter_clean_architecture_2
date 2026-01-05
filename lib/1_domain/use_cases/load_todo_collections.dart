import 'package:flutter_clean_architecture_2/1_domain/entities/todo_collection.dart';
import 'package:flutter_clean_architecture_2/1_domain/failures/failures.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_clean_architecture_2/1_domain/repositories/todo_repository.dart';
import 'package:flutter_clean_architecture_2/2_application/core/use_case.dart';

class LoadToDoCollections implements UseCase<List<ToDoCollection>, NoParams> {
  const LoadToDoCollections({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<ToDoCollection>>> call(NoParams params) async {
    try {
      final loadedCollections = toDoRepository.readToDoCollections();

      return loadedCollections.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
