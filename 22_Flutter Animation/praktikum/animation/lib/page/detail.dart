import 'package:flutter/material.dart';

class DetailArguments{
  final String? image;
  final String? name;

  DetailArguments({
    required this.image,
    required this.name,
  });
}

class Detailagens extends StatefulWidget {
  const Detailagens({super.key});

  @override
  State<Detailagens> createState() => _DetailagensState();
}

class _DetailagensState extends State<Detailagens> {
 
  @override
  Widget build(BuildContext context) {



/*class Detailagens extends StatelessWidget {
  const Detailagens({
    super.key,
  });*/
    final details = ModalRoute.of(context)?.settings.arguments as DetailArguments?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agens Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Container(
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(details?.image??""),
                  ),
                ),
              ),
            ),
            const SizedBox( height: 25,),
            Center(
              child: Text(details?.name??"", 
              style:const TextStyle(fontSize: 30,fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}