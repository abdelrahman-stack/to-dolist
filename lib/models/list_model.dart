import 'package:hive/hive.dart';
part 'list_model.g.dart';
@HiveType(typeId: 0)
class ListModel extends HiveObject{
  @HiveField(0)
   String title;
    @HiveField(1)

   bool isDone;

  ListModel({required this.title,  this.isDone = false});
}
