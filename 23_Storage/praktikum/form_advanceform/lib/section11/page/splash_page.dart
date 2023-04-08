import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:form_advanceform/section11/page/dashboard_page.dart';
import 'package:form_advanceform/section11/page/login_page.dart';
import 'package:form_advanceform/section11/utils/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkUser() async {
    Timer(
      Duration(seconds: 2),
      () async {
        final cekUserLogin = await getValue(keyToken);

        if (cekUserLogin.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Icon(
          Icons.accessible_rounded,
          size: 150,
        ),
      ),
    );
  }
}
