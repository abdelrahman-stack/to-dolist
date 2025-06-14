import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/models/list_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(ListModel task) async {
    emit(AddTaskLoading());
    try {
      var notesBox = Hive.box<ListModel>('tasksBox');
      await notesBox.add(task);
      emit(AddTaskSeccess());
    } catch (e) {
      emit(AddTaskfailure(e.toString()));
    }
  }
}
