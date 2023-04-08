// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Contact {
  String Name;
  String contact;
  String date;
  Color? color = Colors.pink;

  Contact({
    required this.Name,
    required this.contact,
    required this.date,
    this.color,
  });
}