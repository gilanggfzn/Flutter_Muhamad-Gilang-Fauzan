import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:animation/page/detail.dart';
import 'package:animation/page/gridpage.dart';
import 'package:animation/provider/image_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PhotoProvider>(
        create: (_) => PhotoProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/detail':
            return PageAnimationTransition(
                page: const Detailagens(),
                pageAnimationType: LeftToRightFadedTransition());

          default:
            return null;
        }
      },
    );
  }
}
