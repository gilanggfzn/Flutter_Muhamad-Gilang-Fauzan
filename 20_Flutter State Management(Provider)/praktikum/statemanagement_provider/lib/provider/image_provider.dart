import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:statemanagement_provider/page/detail.dart';
import '../models/agen.dart';

class PhotoProvider with ChangeNotifier{
    final List<Agen> _agens = [
    Agen(
      name: 'JETT',
      image:
          'https://images.wallpapersden.com/image/download/jett-valorant-illustration_bGdubmuUmZqaraWkpJRmbmdlrWZnZWU.jpg',
    ),
    Agen(
      name: 'PHOENIX',
      image: 'https://th.bing.com/th/id/OIP.mtswH6E49uxPv6OGua_OjAHaKJ?pid=ImgDet&rs=1', //'assets/images/2.png',
    ),
    Agen(
      name: 'REYNA',
      image: 'https://th.bing.com/th/id/OIP.oQeQBzwvbboMxfF3zq1hWgAAAA?pid=ImgDet&rs=1', //'assets/images/3.png',
    ),
    Agen(
      name: 'YORU',
      image: 'https://th.bing.com/th/id/OIP.jzRLLd1pVH5CLRiyrOvO3wHaD9?pid=ImgDet&rs=1', //'assets/images/4.png',
    ),
    Agen(
      name: 'RAZE',
      image: 'https://cdn1.dotesports.com/wp-content/uploads/2020/04/09061307/raze-valorant-beta.jpg', //'assets/images/4.png',
    ),
    Agen(
      name: 'NEON',
      image: 'https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2022/01/ValorantNeonCosplay-scaled.jpeg', //'assets/images/4.png',
    ),
  ];

  List<Agen> get agens => _agens;


   Future<dynamic> bottomSheet({
    required BuildContext context,
    required int index,
    required PhotoProvider photosProvider,
  }) {
    return showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            dialogSheet(
              context: context,
              index: index,
              photosProvider: photosProvider,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //icon lose bottomsheet
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 30, left: 30),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(photosProvider.agens[index].image),
                  ),
                ),
              ),
              Padding(
                padding:
                  const EdgeInsets.only(right: 180, top: 10, bottom: 20),
                child: Text(photosProvider.agens[index].name),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<dynamic> dialogSheet({
  required BuildContext context,
  required int index,
  required PhotoProvider photosProvider,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          actions: [
            Center(
              child: Image(
                image: NetworkImage(photosProvider.agens[index].image),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                     TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
                TextButton(onPressed: (){     
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    '/detail',
                    arguments: DetailArguments(
                      image: photosProvider.agens[index].image, 
                      name: photosProvider.agens[index].name,)
                  );
                 },
                child: const Text('Show Detail Agens'),),
                 /* Navigator.of(context, rootNavigator: true).pushNamed(
                    '/detail',
                    arguments: DetailArguments(
                      image: photosProvider.agens[index].image, 
                      name: photosProvider.agens[index].name,)
                  );
                }, child: const Text('Show Detail Agens'))*/

                /*TextButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                     (context, Animation, secondaryAnimation){
                      return Detailagens();
                     },
                     transitionsBuilder: (
                      context, animation, secondaryAnimation, child) {
                       final tween = Tween(begin: Offset(0, .5), end: Offset.zero);
                       return SlideTransition(position: animation.drive(tween),
                       child: child,);
                     },
                     ),
                     );*/
                     
                   /* Navigator.of(context, rootNavigator: true).push(PageAnimationTransition(
                      page: const Detailagens(),
                      pageAnimationType: TopToBottomFadedTransition())
                    );*/
                     /* '/detail', 
                      arguments: DetailArguments(
                        image: photosProvider.agens[index].image,
                        name: photosProvider.agens[index].name,
                      ),
                    );*/
             
                
               
              ],
            )
          ],
        ),
      );
    },
  );
}



