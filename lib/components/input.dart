import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String errorMessage;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.errorMessage});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) return widget.errorMessage;
        },
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            isDense: true,
            labelText: widget.label),
      ),
    );
  }
}
