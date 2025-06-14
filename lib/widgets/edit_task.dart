import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_list/models/list_model.dart';
import 'package:to_do_list/widgets/custom_app_bar.dart';
import 'package:to_do_list/widgets/custom_text_field.dart';

class EditTaskBody extends StatefulWidget {
  const EditTaskBody({super.key, required this.list});
  final ListModel list;

  @override
  State<EditTaskBody> createState() => _EditTaskBodyState();
}

String? title, content;

class _EditTaskBodyState extends State<EditTaskBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.list.title = title ?? widget.list.title;

              widget.list.save();
              BlocProvider.of<ToDoCubit>(context).fetchAllTasks();
              Navigator.pop(context);
            },
            tittle: 'Edit To-Do List',
            icon: Icons.check,
          ),
          SizedBox(height: 50),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.list.title,
          ),
          SizedBox(height: 16),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}
