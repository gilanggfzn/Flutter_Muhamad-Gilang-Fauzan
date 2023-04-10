import 'package:api_prio1/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({super.key});

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Detail Post"),
        centerTitle: true,
      ),
       body: FutureBuilder(
          future: PostService().getDetailPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final post = snapshot.data;
              return ListView.builder(
                itemCount: 1,
                  itemBuilder: (context, index) {
                    var data = post;
                    return Column(
                      children: [
                        SizedBox(height: 25,),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.grey,
                            textColor: Colors.black,
                            contentPadding: const EdgeInsets.all(15,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.blueGrey,
                                width: 4,style: BorderStyle.solid)),
                            leading: Text(data?.id.toString() ?? "-",),
                            title: Text(data?.title ?? "-",style: TextStyle(fontWeight: FontWeight.w600),),

                            subtitle: Text(data?.body ?? "-",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return const Text('Error');
            } else {
              return const CircularProgressIndicator();
            }
          }),

    );
  }
}