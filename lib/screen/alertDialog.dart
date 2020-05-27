import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogs {
  static Future<void> showAlertDialog(
      BuildContext context, GlobalKey key, String msg) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          //title: new Text('You clicked on'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(msg,style: Theme.of(context).textTheme.bodyText1, ),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok', style: Theme.of(context).textTheme.headline3,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}