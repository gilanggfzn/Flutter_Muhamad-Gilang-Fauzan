import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'apk Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'app android'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          backgroundColor: Colors.grey,
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Home',
                style: TextStyle(
                  color: Colors.white,
                ),),
                ),
                ListTile(
                  title: Text('settings',
                   style: TextStyle(
                  color: Colors.white,),
                ),
            ),],
            ),),
        appBar: AppBar( backgroundColor: Colors.grey,title: const Text('Material App'),
        ),
        body: const Center( child: Text('this is Material App', style: TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',backgroundColor: Colors.grey,
            ),
          ],
        ));
  }
}
