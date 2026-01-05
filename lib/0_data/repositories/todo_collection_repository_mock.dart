import 'package:either_dart/either.dart';
import 'package:flutter_clean_architecture_2/1_domain/entities/todo_collection.dart';
import 'package:flutter_clean_architecture_2/1_domain/entities/todo_color.dart';
import 'package:flutter_clean_architecture_2/1_domain/entities/unique_id.dart';
import 'package:flutter_clean_architecture_2/1_domain/failures/failures.dart';
import 'package:flutter_clean_architecture_2/1_domain/repositories/todo_repository.dart';

class ToDoRepositoryMock implements ToDoRepository {
  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    final list = List<ToDoCollection>.generate(
      10,
      (index) => ToDoCollection(
        id: CollectionId.fromUniqueString(index.toString()),
        title: 'title $index',
        color: ToDoColor(colorIndex: index % ToDoColor.predefinedColors.length),
      ),
    );

    return Future.delayed(const Duration(milliseconds: 200), () => Right(list));
  }
}
