import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onChanged, this.onSaved, required this.hint,  this.maxLine = 1});
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String hint;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Feildis required";
        } else {
          return null;
        }
      },
      cursorColor: Color(0xff4933A9),
      maxLines:maxLine ,
      decoration: InputDecoration(
        hintText: hint,
border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xff4933A9)),
    );
  }
}
