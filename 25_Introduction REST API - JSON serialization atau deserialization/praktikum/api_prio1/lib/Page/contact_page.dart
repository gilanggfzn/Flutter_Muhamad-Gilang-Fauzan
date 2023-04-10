import 'package:api_prio1/Page/create_contact_page.dart';
import 'package:api_prio1/Page/detail_kontak_page.dart';
import 'package:api_prio1/Page/post_page/detail_post_page.dart';
import 'package:api_prio1/service/kontak_service.dart';
import 'package:api_prio1/widgett/button_custome.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Daftar Contacts',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CreateContactPage(),
              ),
            ).then((value) async {
              await KontakService().getkontak();
              setState(() {});
            });
          },
          icon: const Icon(
            Icons.contact_phone_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: KontakService().getkontak(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final contacts = snapshot.data;
              return ListView.builder(
                  itemCount: contacts?.length,
                  itemBuilder: (context, index) {
                    var data = contacts?[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailKontakPage(
                                    idKontak: data?.id.toString() ?? "",
                                  ))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: ListTile(
                              iconColor: Colors.blue,
                              tileColor: Colors.grey,
                              textColor: Colors.black,
                              contentPadding: const EdgeInsets.all(
                                15,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: Colors.blueGrey,
                                      width: 4,
                                      style: BorderStyle.solid)),
                              leading: Text(data?.id.toString() ?? "-"),
                              title: Text(data?.name ?? "-"),
                              subtitle: Text(data?.phone ?? "-"),
                            ),
                          ),
                          ButtonCustome(
                            title: 'Detail Post',
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPostPage(
                                 //idPost: data?.id.toString() ?? "",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
