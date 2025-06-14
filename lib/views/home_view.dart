import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/add_to_do_list.dart';
import 'package:to_do_list/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'To-Do List',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff4933A9),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notes_outlined, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddToDoList();
            },
          );
        },
        backgroundColor: Color(0xff4933A9),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
