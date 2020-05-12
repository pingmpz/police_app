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

  // !- Filter Values
  String typeValue = 'All';
  String currentTypeValue = 'All';

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
  void testData() {
    eventList.add(new Event(1, 'Event #1', 'MON 07 AUG 2020 19.04', 1));
    eventList.add(new Event(2, 'Event #2', 'MON 07 AUG 2020 19.04', 1));
    eventList.add(new Event(3, 'Event #3', 'MON 07 AUG 2020 19.04', 2));
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

  // For Filter Only
  Widget _buildSpace() {
    return SizedBox(width: 10, height: 10);
  }

  List<Widget> mapDropdownButtonList(List<String> list){
    return list.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  void setFilterValues(bool reverse){
    if(!reverse){
      currentTypeValue = typeValue;
    } else {
      typeValue = currentTypeValue;
    }
  }

  createFilterBox(BuildContext context) async {
    setFilterValues(false);
    return await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Filter'),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text('Type'),
                    _buildSpace(),
                    DropdownButton<String>(
                      value: typeValue,
                      items: mapDropdownButtonList(['All', '1', '2']),
                      onChanged: (String value) {
                        setState(() {
                          typeValue = value;
                        });
                      },
                    ),
                  ],
                );
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Confirm'),
                onPressed: (){
                  Navigator.pop(context);
                  print(typeValue);
                },
              ),
              FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  setFilterValues(true);
                  Navigator.pop(context);
                  print(typeValue);
                },
              ),
            ],
          );
        });
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
              icon: const Icon(Icons.tune),
              color: icon2Color,
              onPressed: () {
                createFilterBox(context);
              },
            ),
          ],
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

