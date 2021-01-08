import 'package:ewalet_flutter_app/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_view.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    moveToHomeScreen(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _splashComponent(),
    );
  }
}

Future<void> moveToHomeScreen(context){
  return Future.delayed(Duration(seconds: 3), (){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
  });
}

Widget _splashComponent() {
  return Scaffold(
    backgroundColor: HexColor("#E64A19"),
    body: Center(
      child: Wrap(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 32.0),
                decoration: BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Hero(
                  tag: "logo",
                  child: SvgPicture.asset(
                    'assets/icons/swallow.svg',
                    height: 160.0,
                    width: 160.0,
                    color: HexColor("#E64A19"),
                  ),
                ),
              ),
              Text("e-Walet", style: TextStyle(color: Colors.white, fontSize: 36.0),),
              Container(
                  margin: EdgeInsets.only(top: 36.0),
                  child: Text("Let's make our world better", style: TextStyle(color: Colors.white, fontSize: 24.0),))
            ],
          )
        ],
      )
      ,
    )    ,
  );
}
