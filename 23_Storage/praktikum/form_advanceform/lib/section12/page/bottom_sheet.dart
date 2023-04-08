
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:form_advanceform/section11/Style/style.dart';
import 'package:form_advanceform/section12/provider/image_provider.dart';
import 'package:form_advanceform/section12/widget/bottomsheet.dart';
import 'package:provider/provider.dart';


class bottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PhotosProvider =Provider.of<PhotoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Agen Grid '),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: PhotosProvider.agens.length,
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                context: context,
                builder: (context) => BottomSheetComponent(
                    image: PhotosProvider.agens[index].image, name: PhotosProvider.agens[index].name),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: blackcolor,width: 5),
                image: DecorationImage(
                  image: NetworkImage(PhotosProvider.agens[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
   const bottomsheet({
    super.key,
  });

}
