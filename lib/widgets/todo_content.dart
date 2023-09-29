// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/pages/detail_page.dart';

import 'package:todo_list/theme.dart';

class TodoContent extends ConsumerWidget {
  final Todo todo;
  const TodoContent({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(todo: todo)));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 6, bottom: 5, right: 16),
        width: 327,
        height: 120,
        decoration: ShapeDecoration(
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(todo.title!, style: body1.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(todo.description!, style: body2),
          const Spacer(),
          // Text('Created at $date', style: body3.copyWith(fontSize: 11))
        ]),
      ),
    );
  }
}
