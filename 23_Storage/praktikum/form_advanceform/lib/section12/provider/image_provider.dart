import 'package:flutter/material.dart';
import '../widget/agen.dart';

class PhotoProvider with ChangeNotifier{
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

  List<agen> get photos => agens;
}