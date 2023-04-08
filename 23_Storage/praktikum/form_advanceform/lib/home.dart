import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('section 11'),
            subtitle: const Text('Form & Advance Form Input'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            title: const Text('section12'),
            subtitle: const Text('Assets, Dialog Bottomsheet, Navigation'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, '/dialog');
            },
          ),
        ],
      ),
    );
  }
}
