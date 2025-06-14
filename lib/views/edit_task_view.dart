import 'package:flutter/material.dart';
import 'package:to_do_list/models/list_model.dart';
import 'package:to_do_list/widgets/edit_task.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.list});
final ListModel list;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: EditTaskBody(list: list),
    );
  }
}