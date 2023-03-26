import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form/Style/style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:intl/intl.dart';

class AdvanceForm extends StatefulWidget {
  const AdvanceForm({super.key});

  @override
  State<AdvanceForm> createState() => _AdvanceFormState();
}

class _AdvanceFormState extends State<AdvanceForm> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.pink;
  final isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Text(
          'Interactive Widgets',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Build Date Picker
          buildDatePicker(context),
          const SizedBox(height: 10),
          const Divider(thickness: 5),

          // Buiild Color Picker
          buildColorPicker(),
          const SizedBox(height: 10),
          const Divider(thickness: 5),

          // Build File Picker
          buildFilePicker(),
        ],
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Color'),
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
