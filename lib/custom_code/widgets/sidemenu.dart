// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
//import '../../barchart/barchart_widget.dart';
//import '../../candlesticks/candlesticks_widget.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({
    Key key,
    this.width,
    this.height,
    this.items,
  }) : super(key: key);

  final double width;
  final double height;
  final List<SidemenuRecord> items;

  @override
  _SidemenuState createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  PageController page = PageController();
  final List<SideMenuItem> _result = [];

  //TODO add more from https://fontawesomeicons.com/flutter/icons
  final _icons = {
    'notifications': Icons.notifications,
    'search': Icons.search,
    "settings": Icons.settings,
    "home": Icons.home
  };

  //https://medium.com/analytics-vidhya/simplest-way-to-create-icons-dynamically-in-flutter-66e0b10984c6

  @override
  void initState() {
    super.initState();
    for (var result in widget.items) {
      _result.add(SideMenuItem(
        priority: result.priority,
        title: result.title,
        icon: Icon(_icons[result.icon]),
        onTap: () {
          //TODO This is wrong - add a field in DB as pageindex and use below
          page.jumpToPage(result.priority);
        },
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            ),
            title: Column(
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 150,
                      maxWidth: 150,
                    ),
                    child: Image.asset(
                      'images/logoM.png',
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    )),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            items: _result,
          ),
          Expanded(
            child: PageView(
              controller: page,
              scrollDirection: Axis.vertical,
              children: [
                //     BarchartWidget(),
                //     CandlesticksWidget(),
                //     BarchartWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
