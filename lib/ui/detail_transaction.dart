import 'package:ewalet_flutter_app/model/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_view.dart';
import 'result_screen.dart';

class TransactionDetail extends StatelessWidget {
  final TransactionModel transactionModel;

  TransactionDetail({this.transactionModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: HexColor("#E64A19"),
          title: Text('Transaction Detail'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(18.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Payment Information',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Status',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            _generateTransactionStatus(
                                status: transactionModel.status),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Date',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            Text(
                              transactionModel.date,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Transaction Type',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            Text(
                              transactionModel.transactionName,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            Text(
                              transactionModel.paymentType,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total Payment',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            Text(
                              transactionModel.transactionNominal,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(""),
            ),
            Container(
              width: double.infinity,
              height: 36.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: RaisedButton(
                onPressed: () {
                  transactionModel.status == 0
                      ? _settingModalBottomSheet(
                          context, transactionModel.transactionNominal)
                      : null;
                },
                color: transactionModel.status == 0
                    ? HexColor("#E64A19")
                    : Colors.grey,
                textColor: Colors.white,
                child: transactionModel.status != 0
                    ? Text('Payment has finished')
                    : Text('Pay'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final _balanceComponent = Container(
  padding: EdgeInsets.all(8.0),
  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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

void _settingModalBottomSheet(context, String nominal) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))),
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
            _balanceComponent,
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: TextStyle(fontSize: 14.0)),
                    Text(nominal,
                        style: TextStyle(
                            fontFamily: 'SansSerif',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultScreen(nominal: nominal);
                  }));
                },
              ),
            )
          ],
        );
      });
}

Text _generateTransactionStatus({int status}) {
  switch (status) {
    case 1:
      return Text(
        "Success",
        style: TextStyle(color: HexColor("#219653"), fontSize: 18.0),
      );
      break;
    case 2:
      return Text(
        "Failed",
        style: TextStyle(color: HexColor("#EF0000"), fontSize: 18.0),
      );
      break;
    case 3:
      return Text(
        "Refund",
        style: TextStyle(color: HexColor("#F2994A"), fontSize: 18.0),
      );
      break;
    default:
      return Text(
        "Pending",
        style: TextStyle(color: HexColor("#F2994A"), fontSize: 18.0),
      );
      break;
  }
}
