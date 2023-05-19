import 'package:flutter/material.dart';
import 'package:lab_project/sidebar.dart';
import 'add_exp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Map<String, dynamic>> listODitems = [];
  List<Map<String, dynamic>> listODitems = [
    {
      "date": "2023-05-01",
      "price": 800,
      "category": "Food",
      "remarks": "Masu Vat",
    },
  ];

  void addItem(Map<String, dynamic> newItem) {
    setState(() {
      listODitems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(addItem: addItem)),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listODitems.length,
          itemBuilder: (context, index) {
            var item = listODitems[index];
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Rs. " + item['price'].toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 2.0),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['category'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item['date'].toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item['remarks'].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
