# Platform Widget
1. MaterialApp (Android)
* widget dasar yang mengemas seluruh widget dalam aplikasi
* widget yang digunakan pada sistem android
* di import dengan package:flutter/material.dart

## Struktur
1. Home
home merupakan sebuah tempat dari widget yang pertama kali dibuka biasanya berisi tema,bisa juga untuk initial route dan routes
2. scaffold
widget dasar yang dipakai untuk membangun halaman pada materialApp,
scaffold membentuk tata letak dasar sebuah halam yang ditulis dengan properti-propertinya
biasanya berisi appbar,drawer,body, bottom navigationbar , dll

```dart
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

```

2. Cupertino App
* widget dasar yang mengemas seluruh widget dalam aplikasi
* widget yang digunakan pada sistem ios
* di import dengan package:flutter/cupertino.dart

## Struktur
1. variabel _themedark dibuat untuk menyimpan tema
2. diperlukan karena cupertino tidak menyediakan themedata.dark() seperti pada materialapp
3. widget yang pertamakali dibuka diletakkan juga pada bagian home
4. cupertinopagescaffold
widget dasar yang dipakai untuk membangun halaman pada cupertinoApp,
biasanya berisi navigationbar dan juga child untuk menggatikan body

```dart 


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
class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
 
      navigationBar:  CupertinoNavigationBar(
        middle: Text('CupertinoApp',),
      ),
      child: Center(
        child: Text('This is cupertinoApp',),
      ),
    );
  }

}
}

```