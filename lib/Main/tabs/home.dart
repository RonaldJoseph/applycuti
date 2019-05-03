import 'package:flutter/material.dart';
import 'package:flutter_app/Main/forms/apply_form.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter_app/Main/screens/table_ecuti.dart';





class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
  }

class _HomeState extends State<Home>
{
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();

  static final List<String> chartDropdownItems = [ 'Last 7 days', 'Last month', 'Last year' ];
  String actualDropdown = chartDropdownItems[0];


  Future<Null> _chooseDate(
      BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text('Welcome..', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0)),
          actions: <Widget>
          [
            Container
              (
              margin: EdgeInsets.only(right: 8.0),
              child: Row
                (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Text('Check Status Apply', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 14.0)),
//                  Icon(Icons.arrow_drop_down, color: Colors.black54)
                ],
              ),
            )
          ],
        ),

        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[

            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Colors.teal,
                          shape: CircleBorder(),
                          child: Padding
                            (
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.settings_applications, color: Colors.white, size: 30.0),
                          )
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                        onPressed: () {},
                        color: Colors.lightGreen,
                        textColor: Colors.white,


                        padding: const EdgeInsets.all(0.0),
                        child: Container(

                            child: Text('Punch in'),

//                      Text('25', style: TextStyle(color: Colors.black45)),
                        ),
                      ),
                      ),
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Colors.amber,
                          shape: CircleBorder(),
                          child: Padding
                            (
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.notifications, color: Colors.white, size: 30.0),
                          )
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.lightGreen,
                          textColor: Colors.white,

                          padding: const EdgeInsets.all(0.0),

                          child: Container(
                            child: Text('Punch out'),
//                      Text('25', style: TextStyle(color: Colors.black45)),
                          ),
                        ),
                      ),

                    ]
                ),

              ),
            ),


            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(20.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [

                Column
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text(' ', style: TextStyle(color: Colors.green, fontSize: 1)),
                      Text('Laporan E-Cuti :', style: TextStyle(color: Colors.green, fontSize: 20)),
                      Text(' ', style: TextStyle(color: Colors.green, fontSize: 1)),



//                      Column
//                        (
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>
//                        [
//
////                          Text('9', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
//                        ],
//                      ),

//                      Material
//                        (
//
//                          child: Center
//                            (
//                              child: Padding
//                                (
//                                padding: const EdgeInsets.all(16.0),
//                                child: new LinearPercentIndicator(
//                                  width: MediaQuery.of(context).size.width - 125,
//                                  animation: true,
//                                  lineHeight: 20.0,
//                                  animationDuration: 2500,
//                                  percent: 0.8,
//                                  center: Text("80.0%"),
//                                  linearStrokeCap: LinearStrokeCap.roundAll,
//                                  progressColor: Colors.green,
//                                ),
//                              )
//                          )
//                      )
                    ]
                ),


                ButtonTheme(
                  padding: const EdgeInsets.all(20.0),
                  minWidth: 150.0,
                  height: 70.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tablecuti()),
                      );
                    },
                    color: Colors.red,
                    textColor: Colors.white,

                    padding: const EdgeInsets.all(0.0),

                    child: Container(
                      child: Text('Papar'),
//                      Text('25', style: TextStyle(color: Colors.black45)),
                    ),
                  ),
                ),

                    ]
                ),
              ),
            ),


            _buildTile(
              Padding
                (
                  padding: const EdgeInsets.all(24.0),
                  child: Column
                    (
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Statistik E-Cuti', style: TextStyle(color: Colors.green, fontSize: 25.0)),


                              Row
                                (
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: <Widget>
                                [


                                  new CircularPercentIndicator(
                                    radius: 120.0,
                                    lineWidth: 13.0,
                                    animation: true,
                                    percent: 0.7,
                                    center: new Text(
                                      "7",
                                      style:
                                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                    ),
                                    footer: new Text(
                                      "Penggunaan Cuti",
                                      style:
                                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.purple,
                                  ),

                                  Text('Test', style: TextStyle(color: Colors.black, fontSize: 20.0)),


//                              Text('Tarikh Mula', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0), textAlign: TextAlign.center),
//                              new IconButton(
//                                icon: new Icon(Icons.calendar_today),
//                                tooltip: 'Choose date',
//                                onPressed: (() {
//                                  _chooseDate(context, _controller.text);
//                                }),
//                              ),
//
//                              Text('Tarikh Akhir', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0), textAlign: TextAlign.center),
//                              new IconButton(
//                                icon: new Icon(Icons.calendar_today),
//                                tooltip: 'Choose date',
//                                onPressed: (() {
//                                  _chooseDate(context, _controller.text);
//                                }),
//                              ),



//                          DropdownButton
//                            (
//                              isDense: true,
//                              value: actualDropdown,
//                              onChanged: (String value) => setState(()
//                              {
//                                actualDropdown = value;
//                                actualChart = chartDropdownItems.indexOf(value); // Refresh the chart
//                              }),
//                              items: chartDropdownItems.map((String title)
//                              {
//                                return DropdownMenuItem
//                                  (
//                                  value: title,
//                                  child: Text(title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.0)),
//                                );
//                              }).toList()
//                          )
                        ],
                      ),

                      Padding(padding: EdgeInsets.only(bottom: 4.0)),
//                      Sparkline
//                        (
//                        data: charts[actualChart],
//                        lineWidth: 5.0,
//                        lineColor: Colors.greenAccent,
//                      )
                    ],
                  )
              ),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(2, 70.0),
            StaggeredTile.extent(2, 270.0),
//            StaggeredTile.extent(2, 110.0),
          ],
        )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }
}

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

