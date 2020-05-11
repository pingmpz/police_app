import 'package:flutter/material.dart';

import 'Event.dart';

class MyEventListPage extends StatefulWidget {
  @override
  _MyEventListPageState createState() => _MyEventListPageState();
}

class _MyEventListPageState extends State<MyEventListPage> {
  Color appBar1Color = Color(0xFF263147);
  Color icon1Color = Colors.white;
  Color appBar2Color = Color(0xFFEFEFEF);
  Color icon2Color = Color(0xFF263147);

  // !- Test Data
  List<Event> eventList = new List();
  List<Widget> cards = new List();

  @override
  void initState() {
    testData(); // !- For Test Only
    setEventList();
    super.initState();
  }

  // !- Test Data
  void testData(){
    eventList.add(new Event(1, 'Event #1', 'MON 07 AUG 2020 19.04'));
    eventList.add(new Event(2, 'Event #2', 'MON 07 AUG 2020 19.04'));
    eventList.add(new Event(3, 'Event #3', 'MON 07 AUG 2020 19.04'));
  }

  void setEventList() {
      cards.clear();
      for (int i = 0; i < eventList.length; i++) {
        cards.add(
          Card(
            child: ListTile(
                title: Text(eventList[i].title),
                subtitle: Text(eventList[i].subtitle),
                onTap: () {
                  // !- F
                }),
          ),
        );
      }
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
        ),
        body: Center(
          child: ListView(
            children: cards,
          ),
        ),
      ),
    );
  }
}
