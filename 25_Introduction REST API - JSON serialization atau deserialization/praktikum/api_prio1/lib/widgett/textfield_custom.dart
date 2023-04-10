import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustome extends StatelessWidget {
  final Function(String)? onChanged;
  final String hintText;
  final String? initialValue;
  const TextFieldCustome({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
      ),
    );
  }
}

class TextFieldNumberCustome extends StatelessWidget {
  final Function(String)? onChanged;
  final String hintText;
  final String? initialValue;
  const TextFieldNumberCustome(
      {super.key, 
      this.onChanged, 
      required this.hintText, 
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
      ),
    );
  }
}
