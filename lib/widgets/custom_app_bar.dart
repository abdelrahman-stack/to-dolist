
import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.tittle, required this.icon, this.onPressed});
  final String tittle;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tittle, style: const TextStyle(fontSize: 28)),
        Spacer(),
        CustomIcon(
          onPressed: onPressed,
          icon: icon),
      ],
    );
  }
}
