import 'package:flutter/material.dart';
import 'package:form_advanceform/home.dart';
import 'package:form_advanceform/section11/page/dashboard_page.dart';
import 'package:form_advanceform/section11/page/login_page.dart';
import 'package:form_advanceform/section11/page/splash_page.dart';
import 'package:form_advanceform/section12/page/bottom_sheet.dart';
import 'package:form_advanceform/section11/page/form.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

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
        '/':(context) => const LoginPage(),
        //'/login':(context) => const LoginPage(),
        '/form':(context) => const FormPage(),
        '/dialog':(context) =>  const bottomsheet(),
      },
       onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/form':
            return PageAnimationTransition(
                page: const FormPage(),
                pageAnimationType: LeftToRightTransition());
          case '/dailog': 
            return PageAnimationTransition(
                page: const bottomsheet(),
                pageAnimationType: LeftToRightTransition());
          default:
            return null;
        }
      },
    );
  }
}

