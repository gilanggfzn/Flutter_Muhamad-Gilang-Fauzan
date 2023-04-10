import 'package:api_prio1/service/kontak_service.dart';
import 'package:api_prio1/widgett/button_custome.dart';
import 'package:api_prio1/widgett/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CreateContactPage extends StatefulWidget {
  const CreateContactPage({super.key});

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  String _name = "";
  String _phone = "";
  //Loading
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Contact'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot)
        
       {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFieldCustome(
                  onChanged: (value) {
                    _name = value;
                    setState(() {});
                  },
                  hintText: 'Name',
                ),
                SizedBox(height: 25,),
                TextFieldNumberCustome(
                  onChanged: (value) {
                    _phone = value;
                    setState(() {});
                  },
                  hintText: 'Phone Number',
                ),
                SizedBox(height: 25,),
                isLoading
                    ? CircularProgressIndicator()
                    : ButtonCustome(
                        padding: EdgeInsets.zero,
                        title: 'Create',
                        onPressed: () async { 
                          isLoading = true;
                          setState(() {});
                          await KontakService().createKontak(
                            context,
                            name: _name,
                            phone: _phone,
                          );
                          Future.delayed(const Duration(seconds: 2),(){
                            isLoading = false;
                            setState(() {});
                          },);
                        },
                      )
              ],
            ),
          ),
        );
      }),
    );
  }
}
