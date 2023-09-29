import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/pages/add_edit_page.dart';
import 'package:todo_list/theme.dart';
import 'package:todo_list/widgets/fomulir_field.dart';
import 'package:todo_list/widgets/tombol.dart';

class DetailPage extends ConsumerStatefulWidget {
  final Todo todo;
  const DetailPage({required this.todo, super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    titleController = TextEditingController(text: widget.todo.title);
    shortDescriptionController =
        TextEditingController(text: widget.todo.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset('assets/back.png', width: 24)),
                  const Spacer(),
                  //* Bagian ini diisi dengan icon edit dan delete
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => FractionallySizedBox(
                                heightFactor: 0.85,
                                child: AddEditPage(true, todo: widget.todo)));
                      },
                      child: Image.asset('assets/edit.png', width: 24)),
                  const SizedBox(width: 20),
                  GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Tombol(
                                        text: 'Delete Todo',
                                        colorText: secondaryColor,
                                        onPressed: () {},
                                        colorButton: Colors.white),
                                    const SizedBox(height: 16),
                                    Tombol(
                                        text: 'Cancel',
                                        colorText: greenColor,
                                        onPressed: () => Navigator.pop(context),
                                        colorButton: Colors.white),
                                    const SizedBox(height: 50)
                                  ])),
                      child: Image.asset('assets/delete.png', width: 24))
                ]),
              ),
              const SizedBox(height: 24),
              //! Bagian ini diisi dengan content dari todo yang dipilih
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(widget.todo.title!, style: header4),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(widget.todo.description!,
                    style: body1.copyWith(color: blackColor)),
              ),
            ]),
            Align(
              heightFactor: 46,
              alignment: Alignment.bottomCenter,
              child: Text('Created at 1 Sept 2021',
                  style: body2.copyWith(color: blackColor)),
            ),
          ],
        ),
      ),
    );
  }
}
