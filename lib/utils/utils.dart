import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({BuildContext context, String message}) {
  FToast fToast = new FToast(context);

  Widget toast = Container(
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      color: Colors.greenAccent
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(CupertinoIcons.check_mark),
        SizedBox(
          width: 12.0,
        ),
        Text(message)
      ],
    ),
  );

  fToast.showToast(child: toast, gravity: ToastGravity.BOTTOM, toastDuration: Duration(seconds: 3));
}