import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/providers/todo_provider.dart';
import 'package:todo_list/theme.dart';
import 'package:todo_list/widgets/fomulir_field.dart';
import 'package:todo_list/widgets/tombol.dart';

class AddEditPage extends ConsumerWidget {
  final Todo? todo;
  final bool isEditing;
  const AddEditPage(this.isEditing, {this.todo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: 80,
            height: 6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(height: 20),
          const TitleField(),
          const SizedBox(height: 16),
          const DescriptionField(),
          const SizedBox(height: 16),
          const Spacer(),
          Tombol(
              text: isEditing == true ? "Edit Todo" : "Add Todo",
              colorText: secondaryColor,
              onPressed: () {
                if (isEditing == false) {
                  ref.watch(todoNotifierProvider).create(Todo(
                        id: ref.watch(todoNotifierProvider).indexTodo,
                        title: titleController.text,
                        description: shortDescriptionController.text,
                      ));
                  ref.watch(todoNotifierProvider).indexTodo + 1;
                } else {
                  ref.watch(todoNotifierProvider).updateTodo(Todo(
                        id: ref.watch(todoNotifierProvider).indexTodo,
                        title: titleController.text,
                        description: shortDescriptionController.text,
                      ));
                }
                Navigator.pop(context);
              },
              colorButton: Colors.white),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
