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
  List<String> typeValueList = ['All', '1', '2'];
  String typeValue = 'All';
  String typeValueTemp = 'All';

  // !- For Data
  List<Event> eventList = new List();
  List<Event> eventListTemp = new List();

  @override
  void initState() {
    prepareData(); // !- For Test Only
    super.initState();
  }

  void prepareData() {
    // !- Test Data
    eventList.add(new Event(1, 'Event #1', 'This Event is type 1', 1));
    eventList.add(new Event(2, 'Event #2', 'This Event is type 1', 1));
    eventList.add(new Event(3, 'Event #3', 'This Event is type 2', 2));
    eventList.add(new Event(3, 'Event #4', 'This Event is type 3', 3));

    eventListTemp = List.from(eventList);
  }

  void setEventList() {
    setState(() {
      eventList = List.from(eventListTemp);
      if (typeValue != typeValueList[0]) {
        for (int i = 0; i < eventList.length; i++) {
          if (eventList[i].type.toString() != typeValue) {
            eventList.removeAt(i);
            i--;
          }
        }
      }
    });
  }

  // !- For Filter Only
  Widget _buildSpace() {
    return SizedBox(width: 10, height: 10);
  }

  List<Widget> mapDropdownButtonList(List<String> list) {
    return list.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  void setFilterValues(bool isCancel) {
    if (!isCancel) {
      typeValueTemp = typeValue;
    } else {
      typeValue = typeValueTemp;
    }
  }

  createFilterBox(BuildContext context) async {
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
                      items: mapDropdownButtonList(typeValueList),
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
                onPressed: () {
                  setFilterValues(false);
                  setEventList();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  setFilterValues(true);
                  setEventList();
                  Navigator.pop(context);
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
          child: ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  child: ListTile(
                      title: Text(eventList[i].title),
                      subtitle: Text(eventList[i].subtitle),
                      onTap: () {
                        // !- F
                      }),
                );
              }),
        ),
      ),
    );
  }
}
