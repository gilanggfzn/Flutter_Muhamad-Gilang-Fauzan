import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter APP',
      theme: ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data=[ 
    'Learn Flutter',
    'Learn ReactJS',
    'Learn VueJS',
    'Learn Tailwind CSS',
    'Learn UI/UX',
    'Learn Figma',
    'Learn Digital Marketing',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF6200EE),
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 20, 20),
              child: Icon(
                Icons.search,
                size: 30,
              ),
            )
          ],
          title: const Text('My Flutter App',),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20, 25, 10, 18),
                child: Text(
                  data[index],
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800]),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: data.length),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 10, 235, 235),
          onPressed: () {},
          child: const Text(
            '+',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {},
          backgroundColor: const Color(0XFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.info_rounded,
                ),
                label: 'Information'),],
        ),
      );
  }
}
