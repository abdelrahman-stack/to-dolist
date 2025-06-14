import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:to_do_list/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_list/widgets/add_form.dart';

class AddToDoList extends StatelessWidget {
  const AddToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskfailure) {}
          if (state is AddTaskSeccess) {
            BlocProvider.of<ToDoCubit>(context).fetchAllTasks();
            // Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(child: AddForm()),
          );
        },
      ),
    );
  }
}
