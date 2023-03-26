import 'package:flutter/material.dart';
import 'package:form/section12/page/bottom_detail.dart';

class DialogSheet extends StatelessWidget {
  final String image;
  final String name;

  const DialogSheet({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Image(
          image: NetworkImage(image),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailsbottom(
                      image: image,
                      name: name,
                    ),
                  ),
                );
              },
              child: const Text('Ya'),
            ),
          ],
        )
      ],
    );
  }
}