import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/style/style.dart';
import 'package:project/widget/button_custome.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _HomeAppState();
}

class _HomeAppState extends State<Mainpage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController NameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pesanController = TextEditingController();
  final isSelected = false;

  var selectedIndex = -1;

  @override
  void dispose() {
    NameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    pesanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          title: Text(
            'LALALA Loundry',
            style: blackTextStyle.copyWith(
              fontSize: 25,
              fontWeight: normal,
            ),
          ),
          centerTitle: true,
        ),
          drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 5, color: Colors.black),
                  ),
                ),
                child: Text('LalaLa Here'),
              ),
              ButtonCustome(
                title: 'Contact Us',
                onPressed: () {},
              ),
              ButtonCustome(
                title: 'About Us',
                onPressed: () {},
              ),
              ButtonCustome(
                  title: 'Login',
                  onPressed: () {},),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 40, left: 40),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/loundry.jpg',
                    width: 180,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Lalala Loundry',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: normal),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    ' Anda cape setelah beraktifitas??? tenang kami siap membantu kalian. Cucian menumpuk? tidak punya waktu buat nyuci? Pengen hemat air dan listrik tapi pakaian pengennya bersih, rapih dan wangi? Jelas kamilah solusinya, Jangan buang waktu kamu yang sangat berharga! Untuk urusan setrikaan, serahkan kepada ahlinya! Terima jasa setrika pakaian. Solusi tepat untuk yang tidak sempat ',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: normal),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  const Divider(thickness: 3),

                  //  NAME
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
                    ],
                    controller: NameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: maincolor,
                        width: 1,
                      )),
                      labelText: 'First Name',
                      hintText: 'Insert Your First Name',
                      labelStyle: blackTextStyle,
                      hintStyle: blackTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: greycolor,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //DOne

                  //no HP
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'No HP tidak boleh kosong!';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp('^0+')),
                    ],
                    controller: phoneController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: maincolor,
                        width: 4,
                      )),
                      labelText: 'phone',
                      prefixText: '0',
                      hintText: ' ....',
                      labelStyle: blackTextStyle,
                      hintStyle: blackTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: greycolor,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //Done

                  // EMail
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong!';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[@]')),
                    ],
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: maincolor, width: 4)),
                      labelText: 'Email',
                      hintText: 'Insert Your Email',
                      labelStyle: blackTextStyle,
                      hintStyle: blackTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: greycolor,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //DOne

                  // Pesan
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Gunakan -- jika tidak ada pesan';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[a-z A-Z]')),
                    ],
                    controller: pesanController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: maincolor,
                        ),
                      ),
                      labelText: 'Pesan Anda',
                      hintText: '....',
                      labelStyle: blackTextStyle,
                      hintStyle: blackTextStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      fillColor: greycolor,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Done

                  //Button
                  SizedBox(
                    width: 90,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maincolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          NameController.text = '';
                          phoneController.text = '';
                          emailController.text = '';

                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Data berhasil ditambah',
                            btnOkOnPress: () {},
                          ).show();
                        });
                      },
                      child: const Text(
                        'Submit',
                      ),
                    ),
                  ),

                  const Divider(thickness: 8),

                  SizedBox(
                    child: Text(
                      'Contact Us',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  SizedBox(
                    child: Text(
                      'Lalala Fitur',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Container(
                    width: 450,
                    height: 300,
                    child: GridView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text(
                                "Fast Clean",
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(height: 10,),
                              Text('Clean ur ur clothes loundry only in an hour'),
                              SizedBox(height: 10,),
                              Icon(
                                Icons.flash_auto,
                                size: 60,
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.purple,
                          ),
                          child: Column(
                            children: [

                              Text(
                                "Normal",
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(height: 10,),
                              Text('Normal loundry 1 day clean'),
                              SizedBox(height: 10,),
                              Icon(
                                Icons.dry_cleaning,
                                size: 60,
                              )
                            ],
                          ),
                        ),
                      ],
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
