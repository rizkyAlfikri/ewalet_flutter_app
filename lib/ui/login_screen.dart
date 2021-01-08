import 'package:ewalet_flutter_app/ui/register_screen.dart';
import 'package:ewalet_flutter_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_view.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenComponent();
  }
}

class _LoginScreenComponent extends State<LoginScreen> {
  bool isPhoneNumberValid = false;
  bool isPasswordValid = false;

  void validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.length >= 9 && phoneNumber.length <= 12) {
      isPhoneNumberValid = true;
    } else {
      isPhoneNumberValid = false;
    }
  }

  void validatePassword(String password) {
    if (password.length >= 6) {
      isPasswordValid = true;
    } else {
      isPasswordValid = false;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 56.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                          tag: "logo",
                          child: Container(
                              margin: EdgeInsets.only(right: 16.0),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                'assets/icons/swallow.svg',
                                height: 72.0,
                                width: 72.0,
                                color: HexColor("#E64A19"),
                              )),
                        ),
                        Text(
                          "e-Walet",
                          style: TextStyle(color: Colors.white, fontSize: 36.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 56.0,
                    ),
                    Wrap(children: <Widget>[
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
                                margin:
                                    EdgeInsets.only(top: 32.0, bottom: 32.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: HexColor("#E64A19"),
                                      fontSize: 32.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: TextFormField(
                                  onChanged: (number) {
                                    setState(() {
                                      validatePhoneNumber(number);
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefix: Text('+62 '),
                                    prefixIcon: Icon(Icons.phone_android),
                                    hintText: 'Phone Number',
                                    labelText: 'Phone Number',
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
                                            color: Colors.grey, width: 1.0)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: TextFormField(
                                  onChanged: (password) {
                                    setState(() {
                                      validatePassword(password);
                                    });
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outline),
                                    hintText: 'Password',
                                    labelText: 'Password',
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
                                            color: Colors.grey, width: 1.0)),
                                  ),
                                ),
                              ),
                              Container(
                                height: 36.0,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  child: Text('Sign In'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  color: isPhoneNumberValid && isPasswordValid
                                      ? HexColor("#E64A19")
                                      : Colors.grey,
                                  onPressed: () {
                                    if (isPhoneNumberValid && isPasswordValid) {
                                      showToast(context: context, message: 'Login Success');
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()),
                                          (route) => false);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Don't have account ? ",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.grey),
                                    ),
                                    Wrap(children: [
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return RegisterScreen();
                                          }));
                                        },
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
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
