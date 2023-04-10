import 'package:dicebear/service/image_service.dart';
import 'package:dicebear/widgett/button_custome.dart';
import 'package:dicebear/widgett/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiceBearPage extends StatefulWidget {
  const DiceBearPage({super.key});

  @override
  State<DiceBearPage> createState() => _DiceBearPageState();
}

class _DiceBearPageState extends State<DiceBearPage> {
  TextEditingController _namaController = TextEditingController();

  String image = "";

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Image'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image.isNotEmpty 
          ? SvgPicture.string(
            image, 
            height: 120,
            width: 120,
            ) 
          : const Text("Image Belum Generate"),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldCustome( 
              controller: _namaController,
              hintText: 'Search Image',
              ),
          ),
          ButtonCustome(
            onPressed: () async {
              image = await ImageService().generateImage(
                _namaController.text,
                );
                setState(() {});
            },
            title: 'Generate Image',
            ),
        ],
      ),
    );
  }
}