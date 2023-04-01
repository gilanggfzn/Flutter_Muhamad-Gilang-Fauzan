// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_provider/provider/image_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final photosProvider = Provider.of<PhotoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agens Grid'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: photosProvider.agens.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              photosProvider.bottomSheet(
                context: context,
                index: index,
                photosProvider: photosProvider,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 3),
                image: DecorationImage(
                  image: NetworkImage(photosProvider.agens[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

