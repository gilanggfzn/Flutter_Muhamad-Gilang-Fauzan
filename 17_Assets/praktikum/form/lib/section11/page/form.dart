import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/section11/Style/style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:form/section11/page/advance_form.dart';
import 'package:open_filex/open_filex.dart';
import 'package:form/section11/widgett/contact.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPage();
}

class _FormPage extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController NameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> allContact = List.empty(growable: true);
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.cyan;
  final isSelected = false;

  var selectedIndex = -1;

  @override
  void dispose() {
    NameController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6750A4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Contacts',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 40, left: 40),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/phone.png',
                    width: 50,
                    height: 70,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Create New Contacts',
                    style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                    style: GoogleFonts.lato(color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 25),
                  const Divider(thickness: 2),

                  // NAME
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name tidak boleh kosong!';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
                    ],
                    controller: NameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 126, 66, 141))),
                      labelText: 'Name',
                      hintText: 'Insert Your Name',
                      labelStyle: GoogleFonts.lato(
                          color: Colors.black, fontWeight: bold),
                      hintStyle: GoogleFonts.lato(
                          color: Colors.black, fontWeight: bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fillColor: const Color(0xff6750A4),
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // DONE

                  //NO HP
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor Telp tidak boleh kosong!';
                      } else if (value.length <= 8) {
                        return "Nomor Telp Wajib Lebih dari 8 angka";
                      }
                      return null;
                    },
                    maxLines: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp('^0+')),
                    ],
                    maxLength: 15,
                    controller: contactController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff6750A4),
                        ),
                      ),
                      labelText: 'Nomor',
                      prefixText: '0 ',
                      hintText: '....',
                      labelStyle:
                          GoogleFonts.lato(color: blackcolor, fontWeight: bold),
                      hintStyle:
                          GoogleFonts.lato(color: blackcolor, fontWeight: bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fillColor: const Color.fromARGB(255, 138, 112, 156),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // DONE

                  // DATE PICKER
                  buildDatePicker(context),
                  const SizedBox(height: 25),
                  // DONE

                  // COLOR PICKER
                  buildColorPicker(),
                  const SizedBox(height: 25),
                  // DONE

                  //FIle Picker
                  buildFilePicker(),
                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // BUTTON SUBMIT
                      SizedBox(
                        width: 80,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: selectedIndex != -1
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    String nameContact =
                                        NameController.text.trim();
                                    String contactNumber =
                                        contactController.text.trim();

                                    if (nameContact.isNotEmpty &&
                                        contactNumber.isNotEmpty) {
                                      setState(() {
                                        NameController.text = '';
                                        contactController.text = '';

                                        allContact.add(Contact(
                                          Name: nameContact,
                                          contact: contactNumber,
                                          date: _dueDate.toString(),
                                          color: _currentColor,
                                        ));

                                        // LOG DEV
                                        print(nameContact);
                                        print('+62 ${contactNumber}');
                                        print(_dueDate.toString());
                                        print(_currentColor.toString());
                                      });
                                    }
                                  }
                                },
                          child: const Text(
                            'Submit',
                          ),
                        ),
                      ),
                      // DONE

                      // BUTTON UPDATE
                      SizedBox(
                        width: 80,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maincolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: selectedIndex >= 0
                              ? () {
                                  if (formKey.currentState!.validate()) {
                                    String nameContact =
                                        NameController.text.trim();
                                    String contactNumber =
                                        contactController.text.trim();
                                    if (nameContact.isNotEmpty &&
                                        contactNumber.isNotEmpty) {
                                      setState(() {
                                        NameController.text = '';
                                        contactController.text = '';
                                        allContact[selectedIndex].Name =
                                            nameContact;
                                        allContact[selectedIndex].contact =
                                            contactNumber;
                                        allContact[selectedIndex].date =
                                            _dueDate.toString();
                                        allContact[selectedIndex].color =
                                            _currentColor;
                                        selectedIndex = -1;
                                      });
                                    }
                                  }
                                }
                              : null,
                          child: const Text(
                            'Update',
                          ),
                        ),
                      ),
                      // EDONE

                       //BUTTON ADVANCE
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AdvanceForm()));
                            },
                            child: const Text(
                              'Advance',
                            ),
                          ),
                        ),
                        //DONE
                    ],
                  ),


                  //List Contact
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'List Contacts',
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            allContact.isEmpty
                ? Center(
                    child: Text(
                      'Kontak Kosong',
                      style: GoogleFonts.lato(color: Colors.grey, fontSize: 18),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => listContacts(index),
                      itemCount: allContact.length,
                    ),
                  ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget listContacts(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          NameController.text = allContact[index].Name;
          contactController.text = allContact[index].contact;
          setState(() {
            selectedIndex = index;
          });
        },
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: allContact[index].color,
              foregroundColor: whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(allContact[index].Name.toTitleCase![0]),
                  const SizedBox(
                    width: 1,
                  ),
                ],
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${allContact[index].Name.toTitleCase}',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: tint),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  '0 ${allContact[index].contact}',
                  style:
                      greyTextStyle.copyWith(fontSize: 13, fontWeight: normal),
                ),
                Text(
                  'Dibuat tanggal :  ${allContact[index].date}',
                  style:
                      greyTextStyle.copyWith(fontSize: 13, fontWeight: normal),
                ),
              ],
            ),

            trailing: SizedBox(
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      NameController.text = allContact[index].Name;
                      contactController.text = allContact[index].contact;
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: const Icon(Icons.edit),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        allContact.removeAt(index);
                      });
                    },
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              },
              child: const Text('select'),
            )
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
    );
  }

  Widget buildColorPicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Color Picker'),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick Your Color'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: 100,
              width: double.infinity,
              color: _currentColor,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildFilePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pick Files',
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _pickFile();
              },
              child: Text(
                'Browse File',
                style: whiteTextstyle.copyWith(fontWeight: normal),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final files = result.files.first;
    _openFile(files);
  }

  void _openFile(PlatformFile file) {
    OpenFilex.open(file.path);
  }
}
