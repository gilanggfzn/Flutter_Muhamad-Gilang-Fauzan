import 'package:flutter/material.dart';
import 'package:form/section11/Style/style.dart';
import 'package:form/section12/widget/agen.dart';
import 'package:form/section12/widget/bottomsheet.dart';

class bottomsheet extends StatelessWidget {
  final List<agen> agens = [
    agen(
      name: 'JETT',
      image:
          'https://images.wallpapersden.com/image/download/jett-valorant-illustration_bGdubmuUmZqaraWkpJRmbmdlrWZnZWU.jpg',
    ),
    agen(
      name: 'PHOENIX',
      image: 'https://th.bing.com/th/id/OIP.mtswH6E49uxPv6OGua_OjAHaKJ?pid=ImgDet&rs=1', //'assets/images/2.png',
    ),
    agen(
      name: 'REYNA',
      image: 'https://th.bing.com/th/id/OIP.oQeQBzwvbboMxfF3zq1hWgAAAA?pid=ImgDet&rs=1', //'assets/images/3.png',
    ),
    agen(
      name: 'YORU',
      image: 'https://th.bing.com/th/id/OIP.jzRLLd1pVH5CLRiyrOvO3wHaD9?pid=ImgDet&rs=1', //'assets/images/4.png',
    ),
     agen(
      name: 'RAZE',
      image: 'https://cdn1.dotesports.com/wp-content/uploads/2020/04/09061307/raze-valorant-beta.jpg', //'assets/images/4.png',
    ),
     agen(
      name: 'NEON',
      image: 'https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2022/01/ValorantNeonCosplay-scaled.jpeg', //'assets/images/4.png',
    ),
  ];

  bottomsheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Agen Grid '),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: agens.length,
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
                    image: agens[index].image, name: agens[index].name),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: blackcolor,width: 5),
                image: DecorationImage(
                  image: NetworkImage(agens[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
