import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // DateFormat日本語化

class NewTransaction extends StatelessWidget {
  final double opacity;
  final Function done;

  const NewTransaction({this.opacity, this.done});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    initializeDateFormatting('ja');
    return Expanded(
        child: AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.all(40.0),
      width: double.infinity,
      color: Colors.white.withOpacity(opacity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            readOnly: true,
            initialValue: 'リスト追加',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
            decoration: InputDecoration(
                isDense: true,
                labelText: 'タイトル',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12)),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  initialValue: '10',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                      isDense: true,
                      icon: Icon(
                        Icons.attach_money,
                      ),
                      contentPadding: EdgeInsets.all(8)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OutlineButton.icon(
                borderSide: BorderSide(width: 1, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {},
                icon: Icon(Icons.today),
                label: Text(
                  DateFormat.yMMMd('ja').format(
                    DateTime.now(),
                  ),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              RaisedButton.icon(
                icon: Icon(Icons.add,color: Colors.white,),
                color: primaryColor,
                onPressed: done,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                label: Text('追加',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
