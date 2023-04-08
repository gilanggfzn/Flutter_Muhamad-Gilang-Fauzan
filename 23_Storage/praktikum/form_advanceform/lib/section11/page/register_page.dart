import 'package:flutter/material.dart';
import 'package:form_advanceform/section11/widgett/button_custome.dart';
import 'package:form_advanceform/section11/widgett/textfield_custom.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Username Property
  String _username = "";
  bool _isUsernameValid = true;
  String _errorUsernameMessage = "";
  bool _isButtonNameValid = false;

  // Password Property
  String _password = "";
  bool _isPasswordValid = true;
  String _errorPasswordMessage = "";
  bool _isHidePassword = true;
  bool _isButtonPasswordValid = false;

  // Confirm Password Property
  String _confirmPassword = "";
  bool _isConfirmPasswordValid = true;
  String _errorConfirmPasswordMessage = "";
  bool _isHideConfirmPassword = true;
  bool _isButtonConfirmPasswordValid = false;

  // Telepon Property
  String _phoneNumber = "";
  bool _isPhoneNumberValid = true;
  String _errorPhoneNumberMessage = "";
  bool _isButtonPhoneNumberValid = false;

  // Email Property
  String _email = "";
  bool _isEmailValid = true;
  String _errorEmailMessage = "";
  bool _isButtonEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:const [
                Text(
                  'Register',
                  style: TextStyle(fontSize: 50.0),
                ),
                 Icon(
                  Icons.app_registration_rounded,
                  size: 100,
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //Field Username
                  TextFieldCustome(
                    hintText: 'Username',
                    onChanged: (value) {
                      _username = value;
                      if (_username.isEmpty) {
                        _isUsernameValid = false;
                        _isButtonNameValid = false;
                        _errorUsernameMessage = "Username Tidak Boleh Kosong!";
                      } else if (_username[0] != _username[0].toUpperCase()) {
                        _isUsernameValid = false;
                        _isButtonNameValid = false;

                        _errorUsernameMessage =
                            "Huruf petama harus diawali dengan kapital";
                      } else if (_username.length < 4) {
                        _isUsernameValid = false;
                        _isButtonNameValid = false;

                        _errorUsernameMessage =
                            "Username harus lebih dari 4 Huruf";
                      } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_username)) {
                        _isUsernameValid = false;
                        _isButtonNameValid = false;
                        _errorUsernameMessage = "Username harus disertai angka";
                      } else {
                        _isButtonNameValid = true;
                        _isUsernameValid = true;
                      }
                      setState(() {});
                    },
                    isValidtextfield: _isUsernameValid,
                    errorMessage: _errorUsernameMessage,
                  ),
                  //Username Done

                  //Field Password
                  TextFieldCustome(
                     hintText: 'Password',
                    onChanged: (value) {
                      _password = value;
                      if (_password.isEmpty) {
                        _errorPasswordMessage = "Password Tidak Boleh Kosong";
                        _isPasswordValid = false;
                        _isButtonPasswordValid = false;
                      } else if (_password[0] != _password[0].toUpperCase()) {
                        _errorPasswordMessage =
                            "Password harus di awali huruf Besar";
                        _isPasswordValid = false;
                        _isButtonPasswordValid = false;
                      } else if (_password.length < 4) {
                        _errorPasswordMessage = "Password harus lebih dari 4";
                        _isPasswordValid = false;
                        _isButtonPasswordValid = false;
                      } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_password)) {
                        _errorPasswordMessage =
                            "Password harus disertai angka";
                        _isPasswordValid = false;
                        _isButtonPasswordValid = false;
                      } else if (_password != _confirmPassword) {
                        _errorPasswordMessage = "Password tidak sesuai dengan Confirm Password";
                        _isPasswordValid = false;
                        _isButtonPasswordValid = false;
                      } else {
                        _isButtonPasswordValid = true;
                        _isPasswordValid = true;
                        _isConfirmPasswordValid = true;
                      }

                      setState(() {});
                    },
                    isObscureText: _isHidePassword,
                    isValidtextfield: _isPasswordValid,
                    errorMessage: _errorPasswordMessage,
                    suffixIconWidget: IconButton(
                      onPressed: () {
                        _isHidePassword = !_isHidePassword;
                        setState(() {});
                      },
                      icon: _isHidePassword
                          ? const Icon(Icons.lock)
                          : const Icon(
                              Icons.lock_open,
                            ),
                    ),
                  ),
                  // Done Password

                  //Confirm Password
                  TextFieldCustome(
                    hintText: 'Confirm Password',
                    onChanged: (value) {
                      _confirmPassword = value;
                      if (_confirmPassword != _password) {
                        _errorConfirmPasswordMessage = "Confirm Password tidak sesuai dengan Password";
                        _isConfirmPasswordValid = false;
                        _isButtonConfirmPasswordValid = false;
                      } else {
                        _isPasswordValid = true;
                        _isConfirmPasswordValid = true;
                        _isButtonConfirmPasswordValid = true;
                      }
                      setState(() {});
                    },
                    isObscureText: _isHideConfirmPassword,
                    isValidtextfield: _isConfirmPasswordValid,
                    errorMessage: _errorConfirmPasswordMessage,
                    suffixIconWidget: IconButton(
                      onPressed: () {
                        _isHideConfirmPassword = !_isHideConfirmPassword;
                        setState(() {});
                      },
                      icon: _isHideConfirmPassword
                          ? const Icon(Icons.lock)
                          : const Icon(
                              Icons.lock_open,
                            ),
                    ),
                  ),
                  //Done

                  //Field Telepon
                  IntlPhoneField(
                    initialCountryCode: 'ID',
                    invalidNumberMessage: 'Nomor Telepon Tidak Sesuai',
                    disableLengthCheck: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (PhoneNumber phoneNumber) {
                      _phoneNumber = phoneNumber.number;
                      if (_phoneNumber.isEmpty) {
                        _errorPhoneNumberMessage =
                            'Phone Number Tidak Boleh Kosong';
                        _isPhoneNumberValid = false;
                        _isButtonPhoneNumberValid = false;
                      } else if (_phoneNumber.length < 4) {
                        _errorPhoneNumberMessage =
                            'Nomor Telepon harus lebih dari 4 angka';
                        _isPhoneNumberValid = false;
                        _isButtonPhoneNumberValid = false;
                      } else {
                        _isPhoneNumberValid = true;
                        _isButtonPhoneNumberValid = true;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      labelText: 'Phone Number',
                      errorText:
                          _isPhoneNumberValid ? null : _errorPhoneNumberMessage,
                    ),
                  ),
                  //Done Phone

                  //Field Email
                  TextFieldCustome(
                    hintText: 'Email',
                    isValidtextfield: _isEmailValid,
                    errorMessage: _errorEmailMessage,
                    onChanged: (value) {
                      _email = value;
                      if (_email.isEmpty) {
                        _errorEmailMessage = "Email Tidak Boleh Kosong";
                        _isEmailValid = false;
                      } else if (!EmailValidator.validate(_email)) {
                        _errorEmailMessage = "Email Tidak Sesuai";
                        _isEmailValid = false;
                        _isButtonEmailValid = false;
                      } else {
                        _isEmailValid = true;
                        _isButtonEmailValid = true;
                      }
                      setState(() {});
                    },
                  ),
                  //Email done
                ],
              ),
            ),


            ButtonCustome(
              onPressed: _isButtonNameValid &&
                      _isButtonPasswordValid &&
                      _isButtonConfirmPasswordValid &&
                      _isButtonPhoneNumberValid &&
                      _isButtonEmailValid
                  ? () {}
                  : null,
              title: 'Register', 
            )
          ],
        ),
      ),
    );
  }
}