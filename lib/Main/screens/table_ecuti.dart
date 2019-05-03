import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:async';


class Tablecuti extends StatefulWidget {


  @override
  _Tablecuti createState() => new _Tablecuti();

}

class _Tablecuti extends State<Tablecuti> {

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
        appBar: AppBar
          (
      automaticallyImplyLeading: false,
    elevation: 2.0,
    backgroundColor: Colors.blueGrey,
    title: Text('Report E-Cuti', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22.0)),
  leading: IconButton(icon:Icon(Icons.arrow_back),
    color: Colors.white,
  onPressed:() => Navigator.pop(context),
  ),
    ),


        body: new Container(
      child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
      child: Table(
          border: TableBorder.all(width: 1.0, color: Colors.black),
          children: [
          TableRow(children: [
            TableCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text('Punch in'),
                  new Text('Punch out'),
//                  new Text(['Punch out'].toString()),
                ],
              ),
            )
          ]),
    ],
        ),
    ),
],


    ),
        ),
);
}

}

//
//  Future<Map> loadData() async {
//    http.Response response = await http.get(
//        Uri.encodeFull("http://dummy.restapiexample.com/api/v1/employee/52"),
//        headers: {"Accept": "application/json"});
//    Map data = jsonDecode(response.body);
//    return data;
//  }
//}







//  Attendance({Key key, this.title}) : super(key: key);
//
//  final String title;

//  @override
//  _AttendanceState createState() => _AttendanceState();
//}

//class _AttendanceState extends State<Attendance> {
//  String _timeString;

//
//  @override
//  void initState() {
//    _timeString = _formatDateTime(DateTime.now());
//    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
//    super.initState();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(_timeString
//        ),
//      ),
//      body: Center(
//      child: new Column(
//    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//    children: <Widget>[
//      RaisedButton(
//          child: const Text('Punch in'),
//          color: Theme.of(context).accentColor,
//          elevation: 4.0,
//          splashColor: Colors.blueGrey,
//          onPressed: () {
//            // Perform some action
//          },
//        ),
//      RaisedButton(
//        child: const Text('Punch out'),
//        color: Theme.of(context).accentColor,
//        elevation: 4.0,
//        splashColor: Colors.blueGrey,
//        onPressed: () {
//          // Perform some action
//        },
//      ),
//  ],
//      ),
//
//      ),
//    );
//  }
//
//  void _getTime() {
//
//    final DateTime now = DateTime.now();
//    final String formattedDateTime = _formatDateTime(now);
//    setState(() {
//      _timeString = formattedDateTime;
//    });
//  }
//
//  String _formatDateTime(DateTime dateTime) {
//    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
//  }
//}

