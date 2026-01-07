import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2/1_domain/entities/unique_id.dart';
import 'package:flutter_clean_architecture_2/2_application/components/todo_entry_item/todo_entry_item.dart';
import 'package:flutter_clean_architecture_2/2_application/pages/create_todo_entry/create_todo_entry_page.dart';
import 'package:go_router/go_router.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded({
    super.key,
    required this.collectionId,
    required this.entryIds,
  });

  final List<EntryId> entryIds;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: entryIds.length,
              itemBuilder: (context, index) => ToDoEntryItemProvider(
                collectionId: collectionId,
                entryId: entryIds[index],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                key: const Key('create-todo-entry'),
                onPressed: () {
                  context.pushNamed(
                    CreateToDoEntryPage.pageConfig.name,
                    extra: collectionId,
                  );
                },
                child: const Icon(Icons.add_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
