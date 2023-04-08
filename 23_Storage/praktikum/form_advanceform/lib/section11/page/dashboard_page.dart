import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:form_advanceform/section11/page/login_page.dart';
import 'package:form_advanceform/section11/utils/shared_preferences.dart';
import 'package:form_advanceform/section11/widgett/button_custome.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _username = '';
  String _password = '';

  void initial() async {
    _username = await getValue(keyToken);
    _password = await getValue(keyPassword);
    setState(() {});
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Halo $_username'),
            const Icon(
              Icons.all_out,
              size: 125,
            ),
            ButtonCustome(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                    (route) => false);
                RemoveToken(keyToken);
              },
              title: 'Logout',
            )
          ],
        ),
      ),
    );
  }
}
