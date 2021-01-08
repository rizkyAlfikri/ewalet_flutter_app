import 'package:ewalet_flutter_app/ui/login_screen.dart';
import 'package:ewalet_flutter_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_view.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenComponent createState() {
    return _RegisterScreenComponent();
  }
}

class _RegisterScreenComponent extends State<RegisterScreen> {
  String nameErrorMessage;
  String emailErrorMessage;
  String phoneNumberErrorMessage;
  String passwordErrorMessage;
  String reEnterPasswordErrorMessage;
  String pass;

  Color nameFormColors = Colors.grey;
  Color emailFormColors = Colors.grey;
  Color phoneNumberFormColors = Colors.grey;
  Color passwordFormColors = Colors.grey;
  Color reEnterPasswordFormColors = Colors.grey;

  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPhoneNumberValid = false;
  bool isPasswordValid = false;
  bool isReEnterPasswordValid = false;
  bool isAllFormValid = false;

  void validateName({String name}) {
    RegExp nameRegex = new RegExp("^[a-zA-Z\\s]{1,30}\$",
        caseSensitive: false, multiLine: false);

    isNameValid = nameRegex.hasMatch(name);

    if (!isNameValid) {
      nameErrorMessage =
          "Name field should alphabet only with 30 characters maximum!";
      nameFormColors = Colors.red;
    } else {
      nameErrorMessage = "";
      nameFormColors = Colors.green;
    }
  }

  void validateEmail({String email}) {
    RegExp emailRegex = new RegExp("\\b[\\w.-]+@[\\w.-]+\\.\\w{2,4}\\b",
        caseSensitive: false, multiLine: false);

    isEmailValid = emailRegex.hasMatch(email);

    if (!isEmailValid) {
      emailErrorMessage = "Wrong Email Format! Example : dicoding@gmail.com";
      emailFormColors = Colors.red;
    } else {
      emailErrorMessage = "";
      emailFormColors = Colors.green;
    }
  }

  void validatePhoneNumber({String phoneNumber}) {
    RegExp phoneNumberRegex =
        new RegExp("(^(^8)\\d{8,11})", caseSensitive: false, multiLine: false);

    isPhoneNumberValid = phoneNumberRegex.hasMatch(phoneNumber);

    if (!isPhoneNumberValid) {
      phoneNumberErrorMessage =
          "Wrong Phone Number format! All Numbers and 9 – 12 digits!";
      phoneNumberFormColors = Colors.red;
    } else {
      phoneNumberErrorMessage = "";
      phoneNumberFormColors = Colors.green;
    }
  }

  void validatePassword({String password}) {
    RegExp passwordRegex = new RegExp(
        "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\\W]).{8,20})",
        caseSensitive: false,
        multiLine: false);

    isPasswordValid =
        passwordRegex.hasMatch(password) && !password.contains(" ");

    if (!isPasswordValid) {
      passwordErrorMessage =
          "Wrong Phone Number format! All Numbers and 9 – 12 digits!";
      passwordFormColors = Colors.red;
    } else {
      passwordErrorMessage = "";
      passwordFormColors = Colors.green;
    }
  }

  void validateRePassword({String password, String reEnterPassword}) {
    isReEnterPasswordValid = password == reEnterPassword;

    if (!isReEnterPasswordValid) {
      reEnterPasswordErrorMessage = "Password does not match!";
      reEnterPasswordFormColors = Colors.red;
    } else {
      reEnterPasswordErrorMessage = "";
      reEnterPasswordFormColors = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    isAllFormValid = isNameValid &&
            isEmailValid &&
            isPhoneNumberValid &&
            isPasswordValid &&
            isReEnterPasswordValid
        ? true
        : false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  height: (MediaQuery.of(context).size.height / 2),
                    color: HexColor("#E64A19"),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height / 2)),
                  child: Image.asset('assets/images/wave.jpg'),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 72.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 32.0, bottom: 32.0),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: HexColor("#E64A19"), fontSize: 32.0),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: TextFormField(
                                onChanged: (name) {
                                  setState(() {
                                    validateName(name: name);
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.black),
                                  errorText:
                                      !isNameValid ? nameErrorMessage : null,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: nameFormColors, width: 1.0)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: nameFormColors, width: 1.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: nameFormColors, width: 1.0)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: TextFormField(
                                onChanged: (email) {
                                  setState(() {
                                    validateEmail(email: email);
                                  });
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Email',
                                  errorText:
                                      !isEmailValid ? emailErrorMessage : null,
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: emailFormColors, width: 1.0)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: emailFormColors, width: 1.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: emailFormColors, width: 1.0)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: TextFormField(
                                onChanged: (number) {
                                  setState(() {
                                    validatePhoneNumber(phoneNumber: number);
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  labelText: 'Phone Number',
                                  prefixText: "+62 ",
                                  errorText: !isPhoneNumberValid
                                      ? phoneNumberErrorMessage
                                      : null,
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: phoneNumberFormColors,
                                          width: 1.0)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: phoneNumberFormColors,
                                          width: 1.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: phoneNumberFormColors,
                                          width: 1.0)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: TextFormField(
                                onChanged: (password) {
                                  setState(() {
                                    pass = password;
                                    validatePassword(password: password);
                                  });
                                },
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  errorText: !isPasswordValid
                                      ? passwordErrorMessage
                                      : null,
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: passwordFormColors,
                                          width: 1.0)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: passwordFormColors,
                                          width: 1.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: passwordFormColors,
                                          width: 1.0)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: TextFormField(
                                onChanged: (password) {
                                  setState(() {
                                    validateRePassword(
                                        password: pass,
                                        reEnterPassword: password);
                                  });
                                },
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: 'Re Enter Password',
                                  labelText: 'Re Enter Password',
                                  errorText: !isReEnterPasswordValid
                                      ? reEnterPasswordErrorMessage
                                      : null,
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: reEnterPasswordFormColors,
                                          width: 1.0)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: reEnterPasswordFormColors,
                                          width: 1.0)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: reEnterPasswordFormColors,
                                          width: 1.0)),
                                ),
                              ),
                            ),
                            Container(
                                height: 36.0,
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 16.0,
                                    bottom: 32.0),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  child: Text('Register'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  color: isAllFormValid
                                      ? HexColor("#E64A19")
                                      : Colors.grey,
                                  onPressed: () {
                                    if (isAllFormValid) {
                                      showToast(context: context, message: "Register success");
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (context) {
                                        return LoginScreen();
                                      }), (route) => false);
                                    }
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
