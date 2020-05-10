import 'package:flutter/material.dart';
import 'package:policeapp/eventlistpage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color appBar1Color = Color(0xFF263147);
  Color icon1Color = Colors.white;
  Color appBar2Color = Color(0xFFEFEFEF);
  Color icon2Color = Color(0xFF263147);

  Future navigateToEventListPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyEventListPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar1Color,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            color: icon1Color,
            onPressed: () {
              // !- F
            },
          ),
        ],
      ),
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBar2Color,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.my_location),
              color: icon2Color,
              onPressed: () {
                // !- F
              },
            ),
            IconButton(
              icon: const Icon(Icons.format_list_bulleted),
              color: icon2Color,
              onPressed: () {
                navigateToEventListPage(context);
              },
            ),
          ],
        ),
        body: Center(
          child: Text('Map Section'),
        ),
      ),
    );
  }
}
