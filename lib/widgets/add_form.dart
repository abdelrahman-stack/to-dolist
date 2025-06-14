import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:to_do_list/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_list/models/list_model.dart';
import 'package:to_do_list/widgets/custom_button.dart';
import 'package:to_do_list/widgets/custom_text_field.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomTextField(
              hint: 'title',
              onSaved: (value) {
                title = value;
              },
            ),
            SizedBox(height: 25),
            BlocBuilder<AddTaskCubit, AddTaskState>(
              builder: (context, state) {
                return CustomButton(
                  isLoding: state is AddTaskLoading ? true : false,
                  onTap: () async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    await BlocProvider.of<AddTaskCubit>(context)
        .addTask(ListModel(title: title!));

    BlocProvider.of<ToDoCubit>(context).fetchAllTasks();

    Navigator.pop(context);
  } else {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
  }
},

                );
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
