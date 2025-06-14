import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/models/list_model.dart';

part 'to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  List<ListModel> tasks = [];

  ToDoCubit() : super(ToDoInitial());
  List<ListModel>? lists;
  fetchAllTasks() {
    var notesBox = Hive.box<ListModel>('tasksBox');

    lists = notesBox.values.toList();
    emit(ToDoSuccess(lists!));
  }
}
