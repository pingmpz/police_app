import 'package:flutter/material.dart';

class MyEventListPage extends StatefulWidget {
  @override
  _MyEventListPageState createState() => _MyEventListPageState();
}

class _MyEventListPageState extends State<MyEventListPage> {
  Color appBar1Color = Color(0xFF263147);
  Color icon1Color = Colors.white;
  Color appBar2Color = Color(0xFFEFEFEF);
  Color icon2Color = Color(0xFF263147);

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
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                  onTap: () {
                    // !- F
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
