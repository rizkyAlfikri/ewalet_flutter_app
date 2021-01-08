import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_view.dart';
import '../main.dart';

class ResultScreen extends StatelessWidget {
  final nominal;

  ResultScreen({this.nominal});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _resultComponent(context, nominal),
        ),
      ),
    );
  }
}

Widget _resultComponent(context, nominal) => Wrap(children: [
      Container(
        margin: EdgeInsets.only(top: 150.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              child: Icon(
                CupertinoIcons.check_mark_circled,
                size: 150.0,
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'SUCCESS',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8.0, top: 16.0),
              child: Text(
                'Thank you for purchasing.',
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Your payment was successful..',
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Wrap(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Date',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        Text(
                          '17 August 2020',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Transaction Type',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        Text(
                          'Top Up',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Payment',
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        Text(
                          "Rp.$nominal",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 36.0,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: RaisedButton(
                textColor: Colors.white,
                child: Text('Back To Home'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: HexColor("#E64A19"),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                      (route) => false);
                },
              ),
            )
          ],
        ),
      ),
    ]);
