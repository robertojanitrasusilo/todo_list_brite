import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/theme.dart';

TextEditingController titleController = TextEditingController();
TextEditingController shortDescriptionController = TextEditingController();

class TitleField extends ConsumerWidget {
  const TitleField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: titleController,
        style: body1.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Title',
            hintStyle: body1),
      ),
    );
  }
}

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: shortDescriptionController,
        cursorColor: Colors.white,
        maxLines: 15,
        style: body1.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Description',
            hintStyle: body1),
      ),
    );
  }
}
