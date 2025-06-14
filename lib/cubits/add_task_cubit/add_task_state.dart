part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskSeccess extends AddTaskState {}

final class AddTaskfailure extends AddTaskState {
  final String errMessage;

  AddTaskfailure(this.errMessage);
}
