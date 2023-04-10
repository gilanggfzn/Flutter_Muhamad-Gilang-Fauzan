import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustome extends StatelessWidget {
  final Function(String)? onChanged;
  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  const TextFieldCustome({
    super.key,
    this.onChanged,
    required this.hintText,
    this.initialValue, 
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: initialValue,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
      ),
    );
  }
}

