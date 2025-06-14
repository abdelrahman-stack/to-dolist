import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_list/models/list_model.dart';
import 'package:to_do_list/widgets/custom_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        if (state is ToDoSuccess) {
          List<ListModel> lists = state.tasks;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: lists.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: CustomCard(list: lists[index]),
                );
              },
            ),
          );
        } else {
          return Center(child: Text('لا توجد مهام بعد'));
        }
      },
    );
  }
}
