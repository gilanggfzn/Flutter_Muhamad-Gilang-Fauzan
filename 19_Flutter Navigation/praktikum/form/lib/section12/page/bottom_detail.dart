import 'package:flutter/material.dart';

class Detailsbottom extends StatelessWidget {
  final String image;
  final String name;
  const Detailsbottom({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agens Profile'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 180,
              top: 40,
            ),
            child: Text(name, style:const TextStyle(fontSize: 30,fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}