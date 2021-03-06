import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Main/tabs/home.dart' as _firstTab;
import 'package:flutter_app/Main/tabs/dashboard.dart' as _secondTab;
import 'package:flutter_app/Main/tabs/settings.dart' as _thirdTab;
import 'package:flutter_app/Main/screens/apply.dart' as _applyPage;
import 'package:flutter_app/Main/screens/accept.dart' as _acceptPage;
import 'package:flutter_app/Main/screens/support.dart' as _supportPage;
import 'package:flutter_app/Main/forms/apply_form.dart';

//void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Cuti',
        theme: new ThemeData(
            primarySwatch: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.tealAccent,
            primaryColor: Colors.blueGrey, backgroundColor: Colors.white
        ),
        home: new Tabs(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/apply': return new FromRightToLeft(
              builder: (_) => new _applyPage.Apply(),
              settings: settings,
            );
            case '/support': return new FromRightToLeft(
              builder: (_) => new _supportPage.Support(),
              settings: settings,
            );
            case '/accept': return new FromRightToLeft(
              builder: (_) => new _acceptPage.Accept(),
              settings: settings,
            );
          }
        },
    );
  }
}


  // routes: <String, WidgetBuilder> {
  //   '/about': (BuildContext context) => new _aboutPage.About(),
  // }
//));

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

//    if (settings.isInitialRoute)
//      return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
              )
            ]
        ),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )
          .animate(
          new CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {

  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
      appBar: new AppBar(
        title: new Text(
          _title_app,
          style: new TextStyle(
            fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),

      //Content of tabs
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new _firstTab.Home(),
//          new _secondTab.Dashboard(),
          new _thirdTab.Attendance(),


        ],
      ),

      //Tabs
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS ?
      new CupertinoTabBar(
        activeColor: Colors.blueGrey,
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
      ):
      new BottomNavigationBar(
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(

        onPressed:(){  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ApplyFormPage()),
        ); },
        tooltip: 'Apply Cuti',
        child: new Icon(Icons.add),
      ),

      //Drawer
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(
                height: 120.0,
                child: new DrawerHeader(
                  padding: new EdgeInsets.all(0.0),
                  decoration: new BoxDecoration(
                    color: new Color(0xFFECEFF1),
                  ),
                  child: new Center(
                    child: new FlutterLogo(
                      colors: Colors.blueGrey,
                      size: 54.0,
                    ),
                  ),
                ),
              ),
              new ListTile(
                  leading: new Icon(Icons.assignment),
                  title: new Text('Apply Form'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApplyFormPage()),
                    );
                  }
              ),
              new ListTile(
                  leading: new Icon(Icons.assignment_ind),
                  title: new Text('Support Form'),
                  onTap: () {
//                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/support');
                  }
              ),
              new ListTile(
                  leading: new Icon(Icons.assignment_turned_in),
                  title: new Text('Acceptance Form'),
                  onTap: () {
//                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/accept');
                  }
              ),

              new Divider(),
              new ListTile(
                  leading: new Icon(Icons.exit_to_app),
                  title: new Text('Sign Out'),
                  onTap: () {
                    Navigator.pop(context);
                  }
              ),
            ],
          )
      )
  );

  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState((){
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;

      case 1:
        this._title_app = TabItems[1].title;
        break;

      case 2:
        this._title_app = TabItems[2].title;
        break;
    }
  }
}
class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home),
//  const TabItem(title: 'E-Cuti', icon: Icons.dashboard),
  const TabItem(title: 'E-Punch', icon: Icons.access_time)
];
