import 'package:flutter/material.dart';
import 'package:form/home.dart';
import 'package:form/section12/page/bottom_sheet.dart';
import 'package:form/section11/page/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/base':(context) => const Home(),
        '/form':(context) => const FormPage(),
        '/dialog':(context) =>  bottomsheet(),
      },
    );
  }
}

