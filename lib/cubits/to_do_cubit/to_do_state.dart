part of 'to_do_cubit.dart';

@immutable
sealed class ToDoState {}

final class ToDoInitial extends ToDoState {}

final class ToDoSuccess extends ToDoState {
  final List<ListModel> tasks;

  ToDoSuccess(this.tasks);
}
