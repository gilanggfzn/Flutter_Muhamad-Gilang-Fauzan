import 'package:flutter/material.dart';
import 'package:form/section11/Style/style.dart';
import 'package:form/section12/widget/dialog.dart';


class BottomSheetComponent extends StatelessWidget {
  final String image;
  final String name;
  const BottomSheetComponent({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => DialogSheet(
                  image: image,
                  name: name,
                ));
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, right: 30, left: 30),
              width: double.infinity,
              height: 300,
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
              child: Text(name, style:TextStyle(fontSize: 30,fontWeight: bold)),
            ),
          ],
        ),
      ),
    );
  }
}