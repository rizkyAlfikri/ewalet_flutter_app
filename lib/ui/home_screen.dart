import 'package:ewalet_flutter_app/custom_view.dart';
import 'package:ewalet_flutter_app/ui/scanner_screen.dart';
import 'package:ewalet_flutter_app/ui/top_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(children: [
        Container(
          height: 240.0,
          color: HexColor("#E64A19"),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 12.0),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: ListTile(
                          leading: Hero(
                            tag: "logo",
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  'assets/icons/swallow.svg',
                                  height: 36.0,
                                  width: 36.0,
                                  color: HexColor("#E64A19"),
                                )),
                          ),
                          title: Text(
                            'e-Walet',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'SansSerif',
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 12.0),
                        child: Icon(
                          CupertinoIcons.bell_solid,
                          color: Colors.white,
                        ),
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.0, top: 4.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Walet Point',
                            style: TextStyle(
                                fontFamily: 'SansSerif',
                                fontSize: 16.0,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.navigate_next,
                            size: 13.0,
                            color: HexColor("#E64A19"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Rp.',
                          style: TextStyle(
                              fontFamily: 'SansSerif',
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                            '100.000',
                            style: TextStyle(
                                fontFamily: 'SansSerif',
                                fontSize: 24.0,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ScannerScreen();
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/scanner_code.svg',
                                color: Colors.white,
                                width: 36.0,
                                height: 36.0,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "Scan",
                                style: TextStyle(
                                    fontFamily: 'SansSerif',
                                    fontSize: 16.0,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TopUpScreen();
                            }));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 36.0,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "Top Up",
                                style: TextStyle(
                                    fontFamily: 'SansSerif',
                                    fontSize: 16.0,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 36.0,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "Send",
                                style: TextStyle(
                                    fontFamily: 'SansSerif',
                                    fontSize: 16.0,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Column(
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.reply_thick_solid,
                                color: Colors.white,
                                size: 36.0,
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "Receive",
                                style: TextStyle(
                                    fontFamily: 'SansSerif',
                                    fontSize: 16.0,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              color: HexColor("#E64A19"),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 24.0,
                  ),
                  Image.asset('assets/images/wave.jpg'),
                ],
              ),
            ),
            Container(height: 205.0, child: _customCard)
          ],
        )
      ]),
    );
  }
}

final _customCard = Card(
  margin: EdgeInsets.all(16.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.phone_android,
                        color: HexColor('#273CD6'),
                      ),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Colors.white, HexColor('#273CD6')],
                              begin: Alignment(0.0, 0.0),
                              end: Alignment(0.0, 1.0))),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Mobile\nCharge",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.healing,
                      color: HexColor('#38A732'),
                    ),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, HexColor('#38A732')],
                            begin: Alignment(0.0, 0.0),
                            end: Alignment(0.0, 1.0))),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Assurance",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: new SvgPicture.asset(
                      'assets/icons/game.svg',
                      height: 24.0,
                      width: 24.0,
                      color: HexColor('#AF1130'),
                    ),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, HexColor('#AF1130')],
                            begin: Alignment(0.0, 0.0),
                            end: Alignment(0.0, 1.0))),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Games",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.invert_colors,
                        color: HexColor('#039BE5'),
                      ),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Colors.white, HexColor('#039BE5')],
                              begin: Alignment(0.0, 0.0),
                              end: Alignment(0.0, 1.0))),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Water",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.language,
                      color: HexColor('#5011B0'),
                    ),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, HexColor('#5011B0')],
                            begin: Alignment(0.0, 0.0),
                            end: Alignment(0.0, 1.0))),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Internet",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.lightbulb_outline,
                      color: HexColor('#FDD835'),
                    ),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, HexColor('#FDD835')],
                            begin: Alignment(0.0, 0.0),
                            end: Alignment(0.0, 1.0))),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "PLN",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.live_tv,
                      color: HexColor('#FF9800'),
                    ),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, HexColor('#FF9800')],
                            begin: Alignment(0.0, 0.0),
                            end: Alignment(0.0, 1.0))),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Tv Cable",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.more_horiz,
                        color: HexColor('#838383'),
                      ),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Colors.white, HexColor('#838383')],
                              begin: Alignment(0.0, 0.0),
                              end: Alignment(0.0, 1.0))),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "More",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  ),
);
