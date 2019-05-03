import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:async';

class Attendance extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[


              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  backgroundImage: NetworkImage('https://robohash.org/aseem'),
                  maxRadius: 40.0,
                ),
              ),
              Divider(),
              Text('Profile Details'),
              Container(
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Table(
                    border: TableBorder.all(width: 1.0, color: Colors.black),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              new Text('ID'),
                              new Text(['id'].toString()),
                            ],
                          ),
                        )
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              new Text('Name'),
                              new Text(['employee_name'].toString()),
                            ],
                          ),
                        )
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              new Text('Salary'),
                              new Text(['employee_salary'].toString()),
                            ],
                          ),
                        )
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              new Text('Age'),
                              new Text(['employee_age'].toString()),
                            ],
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              ),


// THIS IS FOR DISABLED BUTTON
//          RaisedButton(
//            onPressed: null,
//            child: const Text('Disabled Button'),
//          ),
// THIS IS FOR COLOURED BUTTON
//          RaisedButton(
//            onPressed: () {},
//            textColor: Colors.white,
//            padding: const EdgeInsets.all(0.0),
//            child: Container(
//              decoration: const BoxDecoration(
//                gradient: LinearGradient(
//                  colors: <Color>[Colors.red, Colors.green, Colors.blue],
//                ),
//              ),
//              padding: const EdgeInsets.all(10.0),
//              child: Text('Gradient Button'),
//            ),
//          ),

            ],
          )
      );


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

