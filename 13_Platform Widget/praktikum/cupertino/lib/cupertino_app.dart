import 'package:flutter/cupertino.dart';
import 'cupertino_page.dart';


class MyApp extends StatelessWidget {
  final _themeDart =const CupertinoThemeData.raw(
    Brightness.dark, 
    null, 
    null, 
    null, 
    null, 
    null);
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themeDart,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}