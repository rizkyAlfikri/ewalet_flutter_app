import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:ewalet_flutter_app/model/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<BubbledNavigationBarItem> bottomNavigationItems = [
  BubbledNavigationBarItem(
      icon: Icon(
        CupertinoIcons.home,
        size: 30,
        color: Colors.blue,
      ),
      activeIcon: Icon(
        CupertinoIcons.home,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        'Home',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      )),
  BubbledNavigationBarItem(
      icon: Icon(
        Icons.assignment,
        size: 30,
        color: Colors.green,
      ),
      activeIcon: Icon(
        Icons.assignment,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        'History',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      )),
  BubbledNavigationBarItem(
      icon: Icon(
        CupertinoIcons.profile_circled,
        size: 30,
        color: Colors.indigo,
      ),
      activeIcon: Icon(
        CupertinoIcons.profile_circled,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        'Profile',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ))
];

Widget customCardView({TransactionModel transactionModel}) {
  return Container(
    margin: EdgeInsets.symmetric( vertical: 4.0),
    child: Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(8.0),
                child: Text(
                  transactionModel.date,
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      transactionModel.transactionName,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    )),
                Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      transactionModel.transactionNominal,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      transactionModel.paymentType,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    )),
                Container(
                    margin: EdgeInsets.all(8.0),
                    child: _generateTransactionStatus(status: transactionModel.status)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Text _generateTransactionStatus({int status}) {
  switch(status) {
    case 1:
      return Text("Success", style: TextStyle(color: HexColor("#219653"), fontSize: 14.0),);
      break;
    case 2:
      return Text("Failed", style: TextStyle(color: HexColor("#EF0000"), fontSize: 14.0),);
      break;
    case 3:
      return Text("Refund", style: TextStyle(color: HexColor("#F2994A"), fontSize: 14.0),);
      break;
    default:
      return Text("Pending", style: TextStyle(color: HexColor("#F2994A"), fontSize: 14.0),);
      break;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
