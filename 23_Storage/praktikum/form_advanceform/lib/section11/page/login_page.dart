// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:form_advanceform/section11/Style/style.dart';
import 'package:form_advanceform/section11/page/dashboard_page.dart';
import 'package:form_advanceform/section11/page/form.dart';
import 'package:form_advanceform/section11/page/register_page.dart';
import 'package:form_advanceform/section11/utils/shared_preferences.dart';
import 'package:form_advanceform/section11/widgett/button_custome.dart';
import 'package:form_advanceform/section11/widgett/textfield_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Property Username
  String _username = "";
  bool _isusernamevalid = true;
  String _Usernameerrormessage = "";

  //Property Password
  String _password = "";
  bool _ispasswordvalid = true;
  String _passworderrormessage = "";
  bool _isHidepassword = true;

  //Property Button
  bool _isButtonUsernamedisable = false;
  bool _isButtonPassworddisable = false;

  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  get formKey => null;

  void initstate() {}

  @override
  void dispose() {
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.login_rounded,
                size: 120,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    // Username Field
                    TextFieldCustome(
                      onChanged: (value) {
                        _username = value;
                        if (_username.isEmpty) {
                          _isusernamevalid = false;
                          _isButtonUsernamedisable = false;
                          _Usernameerrormessage =
                              'Username Tidak Boleh Kosong!!!';
                        } 
                        else if (_username.length < 4) {
                          _isusernamevalid = false;
                          _isButtonUsernamedisable = false;
                          _Usernameerrormessage =
                              "Username Harus Lebih dari 4 Huruf";
                        }
                        else {
                          _isusernamevalid = true;
                          _isButtonUsernamedisable = true;
                        }
                        setState(() {});
                      },
                      hintText: 'Username',
                      isValidtextfield: _isusernamevalid,
                      errorMessage: _Usernameerrormessage,
                    ),
                    //Done Username

                    // Field Password
                    TextFieldCustome(
                      onChanged: (value) {
                        _password = value;
                        if (_password.isEmpty) {
                          _passworderrormessage = "Password Tidak Boleh Kosong";
                          _ispasswordvalid = false;
                          _isButtonPassworddisable = false;
                        } else {
                          _ispasswordvalid = true;
                          _isButtonPassworddisable = true;
                        }
                        setState(() {});
                      },
                      isObscureText: _isHidepassword,
                      isValidtextfield: _ispasswordvalid,
                      errorMessage: _passworderrormessage,
                      hintText: 'Password',
                      suffixIconWidget: IconButton(
                        onPressed: () {
                          _isHidepassword = !_isHidepassword;
                          setState(() {});
                        },
                        icon: _isHidepassword
                            ? const Icon(Icons.lock)
                            : const Icon(Icons.lock_open),
                      ),
                    ),
                    //Done Password

                    const SizedBox(
                      height: 20,
                    ),

                    //Forget Password
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          style: blackTextStyle,
                        ),
                      ),
                    )
                    //done forget
                  ],
                ),
              ),

              //Button login
              ButtonCustome(
                onPressed: _isButtonUsernamedisable && _isButtonPassworddisable
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FormPage(),
                          ),
                        );
                        SaveToken(
                          key: keyToken,
                          valueToken: _username);
                        SaveToken(
                          key: keyPassword,
                          valueToken: _password);
                      }
                    : null,
                title: 'Login',
                isIcon: true,
                icon: const Icon(Icons.login_rounded),
              ),
              //Done

              //Button Register
              ButtonCustome(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  );
                },
                title: 'Register',
              ),
              //Done
            ],
          ),
        ));
  }
}
