import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'apk Demo',
      home: MyHomePage(title: 'app android'),
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
  List datas=[
    {'username': "Leanne Graham", "phone": "1-770-736-8031 x56442"},
    {"username": "Ervin Howell", "phone": "010-692-6593 x09125"},
    {"username": "Clementine Baunch", "phone": "1-463-123-4447"},
    {"username": "Patricia Lebsack", "phone": "493-170-9623 x156"},
    {"username": "Chelsey Dletrich", "phone": "(254)954-1289"},
    {"username": "Mrs. Dennis Schulist", "phone": "1-477-935-8478 x6430"},
    {"username": "Kurtis Weissnat", "phone": "210.067.6132"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body:ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: datas.length,
          itemBuilder: (context, index){return
         Padding(
           padding: const EdgeInsets.only(bottom: 30),
           child: Container(
            margin:const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Text(datas[index]["username"].toString()[0], style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(datas[index]["username"],style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w800,),),
                      Text(datas[index]["phone"],style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400,),)
                      ],
                  ),
                )
              ],),),
         );}),
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
