import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/pages/add_edit_page.dart';
import 'package:todo_list/providers/todo_provider.dart';
import 'package:todo_list/theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: [
                Image.asset('assets/TO DO LIST.png',
                    width: 83.39, height: 18.62),
                const Spacer(),
                Image.asset('assets/settings.png', width: 24)
              ]),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: [
                Row(children: [
                  Image.asset('assets/list.png', width: 25),
                  const SizedBox(width: 8),
                  Text('TO DO LIST',
                      style: header3.copyWith(color: primaryColor))
                ]),
                const Spacer(),
                Image.asset('assets/filter.png', width: 24)
              ]),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: ref.watch(todoNotifierProvider).getItems(),
              ),
            )
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const FractionallySizedBox(
                    heightFactor: 0.85, child: AddEditPage(false))),
            backgroundColor: primaryColor,
            child: const Icon(Icons.add, color: Colors.white),
          )),
    );
  }
}
