import 'package:ewalet_flutter_app/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_view.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _profileScreenComponent(context: context);
  }
}

Widget _profileScreenComponent({BuildContext context}) {
  return Stack(children: <Widget>[
    Container(
      height: double.infinity,
      color: HexColor("#E64A19"),
    ),
    Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: IconButton(
          icon: Icon(
            Icons.settings,
            size: 24.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height) / 6),
      height: double.infinity,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.0), topLeft: Radius.circular(24.0)),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Text(
              "Rizky Alfikri",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            Container(
              margin: EdgeInsets.only(top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.phone_android,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 24.0,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0, bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "+62896533*****",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  Text(
                    "rizkyalfikri@gmail.com",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey),)
                ),
                child: ListTile(
                  onTap: (){},
                  leading: SvgPicture.asset(
                    'assets/icons/rupiah.svg',
                    color: Colors.grey,
                    height: 24.0,
                    width: 24.0,
                  ),
                  title: Text(
                    "Balance",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey),)
                ),
                child: ListTile(
                  onTap: (){},
                  leading: Icon(Icons.account_circle,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                  title: Text(
                    "Change Profile",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey),)
                ),
                child: ListTile(
                  onTap: (){},
                  leading: Icon(Icons.lock_outline,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                  title: Text(
                    "Change Password",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey),)
                ),
                child: ListTile(
                  onTap: (){},
                  leading: Icon(Icons.fiber_pin,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                  title: Text(
                    "Change Pin Security",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey),)
                ),
                child: ListTile(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                  },
                  leading: Icon(Icons.exit_to_app,
                    color: Colors.grey,
                    size: 24.0,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: (((MediaQuery.of(context).size.height) / 8) - 16),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: HexColor("#E64A19"), width: 3.0)),
        child: Icon(
          Icons.face,
          color: Colors.grey,
          size: 100,
        ),
      ),
    )
  ]);
}
