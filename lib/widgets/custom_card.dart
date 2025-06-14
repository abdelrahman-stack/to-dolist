import 'package:flutter/material.dart';
import 'package:to_do_list/models/list_model.dart';
import 'package:to_do_list/widgets/checkbox_home_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.list});
  final ListModel list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        elevation: 4,
        child: CheckboxHomeView(list: list,),
      ),
    );
  }
}
