import 'package:api_prio1/model/kontak_model/detail_kontak_response.dart';
import 'package:api_prio1/service/kontak_service.dart';
import 'package:api_prio1/widgett/button_custome.dart';
import 'package:api_prio1/widgett/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailKontakPage extends StatefulWidget {
  final String idKontak;
  const DetailKontakPage({super.key, required this.idKontak});

  @override
  State<DetailKontakPage> createState() => _DetailKontakPageState();
}

class _DetailKontakPageState extends State<DetailKontakPage> {
  String _name = "";
  String _phone = "";
  //Loading
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Contacts'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: KontakService().getDetailKontak(widget.idKontak),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      TextFieldCustome(
                        initialValue: snapshot.data?.name,
                        onChanged: (value) {
                          _name = value;
                          setState(() {});
                        },
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 25,),
                      TextFieldNumberCustome(
                        initialValue: snapshot.data?.phone,
                        onChanged: (value) {
                          _phone = value;
                          setState(() {});
                        },
                        hintText: 'Phone Number',
                      ),
                      SizedBox(height: 25,),
                      isLoading
                    ? CircularProgressIndicator()
                    :Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonCustome(
                            padding: EdgeInsets.zero,
                            title: 'Update',
                            onPressed: () async {
                              isLoading = true;
                              setState(() {});
                              await KontakService().updateKontak(
                                context, 
                                name: _name, 
                                phone: _phone, 
                                idKontak: widget.idKontak,
                                );
                                 Future.delayed(const Duration(seconds: 2),(){
                                isLoading = false;
                                setState(() {});
                              },);
                            },
                          ),
                           ButtonCustome(
                            padding: EdgeInsets.zero,
                            title: 'Delete',
                            onPressed: () async { 
                              isLoading = true;
                              setState(() {});
                              await KontakService().deleteKontak(
                                context,
                                name: _name,
                                idKontak: widget.idKontak,
                              );
                              Future.delayed(const Duration(seconds: 2),(){
                                isLoading = false;
                                setState(() {});
                              },);
                            },
                          ),

                      ],
                    )
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  SingleChildScrollView formKontak(
      AsyncSnapshot<DetailKontakResponse> snapshot) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFieldCustome(
              initialValue: snapshot.data?.name,
              onChanged: (value) {
                _name = value;
                setState(() {});
              },
              hintText: 'Name',
            ),
            TextFieldNumberCustome(
              initialValue: snapshot.data?.phone,
              onChanged: (value) {
                _phone = value;
                setState(() {});
              },
              hintText: 'Phone Number',
            ),
            ButtonCustome(
              padding: EdgeInsets.zero,
              title: 'Update',
              onPressed: () async {
                KontakService().updateKontak(
                  context, 
                  name: _name, 
                  phone: _phone, 
                  idKontak: widget.idKontak);
              },
            )
          ],
        ),
      ),
    );
  }
}
