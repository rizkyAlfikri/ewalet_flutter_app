import 'package:ewalet_flutter_app/ui/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_view.dart';

class TopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#E64A19"),
        title: Text(
          "Let's Top Up!",
          style: TextStyle(fontFamily: 'SansSerif', color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          _balanceComponent,
          _topUpLogoComponent,
          _TopUpField()
        ],
      ),
    );
  }
}

final _balanceComponent = Container(
  padding: EdgeInsets.all(8.0),
  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
  decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(8.0)),
  child: Row(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 6.0),
              decoration: BoxDecoration(
                  color: HexColor("#E64A19"), shape: BoxShape.circle),
              child: SvgPicture.asset('assets/icons/swallow.svg',
                  height: 28.0, width: 28.0, color: Colors.white),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Your Balance',
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'SansSerif',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(left: 24.0),
          child: Row(
            children: [
              Text(
                'Rp.',
                style: TextStyle(
                    fontFamily: 'SansSerif',
                    fontSize: 14.0,
                    color: Colors.black),
              ),
              Text(
                '100.000',
                style: TextStyle(
                    fontFamily: 'SansSerif',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    ],
  ),
);

final _topUpLogoComponent = Container(
    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.add_circle,
          color: HexColor("#E64A19"),
          size: 48.0,
        ),
        SizedBox(
          width: 16.0,
        ),
        Text(
          "e-Walet Top Up",
          style: TextStyle(
            color: HexColor("#E64A19"),
            fontFamily: 'SansSerif',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ));

class _TopUpField extends StatefulWidget {
  @override
  _TopUpFieldState createState() {
    return _TopUpFieldState();
  }
}

class _TopUpFieldState extends State<_TopUpField> {
  String topUpBalance;
  String errorMessage;
  bool isNominalValid = false;
  Color colorBorder = Colors.grey;

  void generateErrorMessage(String balance) {
    var nominal = int.parse(balance);
    if (balance.length > 0) {
      if (nominal < 1000) {
        errorMessage = 'Minimal top up is Rp.1000';
        isNominalValid = false;
        colorBorder = Colors.red;
      } else if (nominal > 1000000) {
        isNominalValid = false;
        errorMessage = 'Maximal top up is Rp.1000.000';
        colorBorder = Colors.red;
      } else if (nominal == 0) {
        colorBorder = Colors.grey;
      } else {
        isNominalValid = true;
        colorBorder = Colors.green;
      }
    } else {
      colorBorder = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: 54.0,
          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Container(
            child: TextFormField(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              onChanged: (balance) {
                setState(() {
                  topUpBalance = balance;
                  generateErrorMessage(balance);
                });
              },
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                filled: true,
                hintText: "Enter nominal balance",
                labelText:
                    !isNominalValid ? errorMessage : 'Valid nominal balance',
                labelStyle: TextStyle(color: colorBorder),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: colorBorder, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: colorBorder, width: 1.0)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: colorBorder, width: 1.0)),
                prefixIcon: Container(
                  margin: EdgeInsets.only(left: 16.0, right: 8.0),
                  child: SvgPicture.asset(
                    'assets/icons/rupiah.svg',
                    color: HexColor("#E64A19"),
                    width: 36.0,
                    height: 36.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 36.0,
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: RaisedButton(
            onPressed: () {
              isNominalValid
                  ? _settingModalBottomSheet(context, topUpBalance)
                  : null;
            },
            color: isNominalValid ? HexColor("#E64A19") : Colors.grey,
            textColor: Colors.white,
            child: Text('Top Up'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
          ),
        )
      ],
    );
  }
}

void _settingModalBottomSheet(context, String nominal) {
  FlutterMoneyFormatter nominalFormatted = new FlutterMoneyFormatter (
    amount: double.parse(nominal),
    settings: MoneyFormatterSettings(
      compactFormatType: CompactFormatType.long
    )
  );

  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              child: IconButton(
                  iconSize: 24.0,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.clear,
                    size: 24.0,
                    color: Colors.grey,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0, left: 16.0),
              child: Text('Payment Method',
                  style: TextStyle(color: Colors.black, fontSize: 14.0)),
            ),
            Container(
              height: 58.0,
              margin: EdgeInsets.only(
                  top: 8.0, bottom: 32.0, left: 16.0, right: 16.0),
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(children: <Widget>[
                Image.asset(
                  'assets/images/master_card.png',
                  width: 36.0,
                  height: 24.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Bank Debit Card",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Wrap(children: <Widget>[
                  Text(
                    'Change',
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                  )
                ])
              ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text("Total", style: TextStyle(fontSize: 14.0)),
                Wrap(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 2.0),
                    child: Text(
                      'Rp.',
                      style: TextStyle(
                          fontFamily: 'SansSerif',
                          fontSize: 14.0,
                          color: Colors.black),
                    ),
                  ),
                  Text(nominalFormatted.output.withoutFractionDigits,
                      style: TextStyle(
                          fontFamily: 'SansSerif',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ])
              ]),
            ),
            Container(
              height: 36.0,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: RaisedButton(
                textColor: Colors.white,
                child: Text('PAY'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: HexColor("#E64A19"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ResultScreen(nominal: nominal);
                  }));
                },
              ),
            )
          ],
        );
      });
}
