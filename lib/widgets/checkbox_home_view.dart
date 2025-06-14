import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubits/to_do_cubit/to_do_cubit.dart';
import 'package:to_do_list/models/list_model.dart';
import 'package:to_do_list/views/edit_task_view.dart';
import 'package:to_do_list/widgets/edit_task.dart';

class CheckboxHomeView extends StatefulWidget {
  const CheckboxHomeView({super.key, required this.list});

  final ListModel list;

  @override
  State<CheckboxHomeView> createState() => _CheckboxHomeViewState();
}

class _CheckboxHomeViewState extends State<CheckboxHomeView> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.list.isDone;
  }

  void toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value ?? false;
      widget.list.isDone = isChecked;
      widget.list.save(); // عشان يحفظ التعديل في Hive
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(value: isChecked, onChanged: toggleCheckbox),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTaskView(list: widget.list),
                ),
              );
            },
            child: Text(
              widget.list.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.list.delete();
              BlocProvider.of<ToDoCubit>(context).fetchAllTasks();
            },
            icon: Icon(Icons.delete, size: 30, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
