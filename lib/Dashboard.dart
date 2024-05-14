import 'package:flutter/material.dart';
import 'Order/AddOrder.dart';
import 'Order/OrderDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';// Import the new detail screen

class Item {
  final int id;
  final String name;
  final String parse;
  final DateTime timestamp;

  Item({required this.id, required this.name, required this.parse, required this.timestamp});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['harga'],
      parse: json['parse'],
      timestamp: DateTime.parse(json['created_at']),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Dashboard> {
  List<Item> items = [];

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('http://192.168.1.3:8000/api/order'));
    if (response.statusCode == 200) {
      setState(() {
        Iterable list = json.decode(response.body);
        items = list.map((model) => Item.fromJson(model)).toList();
      });
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  void initState() {
    fetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff3092f3)
                ),
                child: TabBar(
                  indicatorColor: Colors.grey,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Container(
                        constraints: BoxConstraints(
                            minWidth: double.infinity
                        ),
                        child: Icon(
                            Icons.store_mall_directory
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        constraints: BoxConstraints(
                            minWidth: double.infinity
                        ),
                        child: Icon(
                            Icons.delivery_dining
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  //                                                            TAB 1
                  Scaffold(
                    backgroundColor: Color(0xffffffff),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        runApp(AddOrder());
                        this.dispose();
                        //                                                      FUNGSI FLOAT BUTTON
                      },
                      child: const Icon(Icons.add),
                    ),
                    body: Container(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              runApp(OrderDetail(id: items[index].id, name: items[index].name, parse: items[index].parse));
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => OrderDetail(
                              //       id: items[index].id,
                              //       name: items[index].name,
                              //       parse: items[index].parse,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffe3e3e3)
                                ),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Row(children: [
                                          Text('Rp. ', style: TextStyle(fontSize: 20)),
                                          Text(items[index].name, style: TextStyle(fontSize: 20),)
                                        ],),
                                      ),
                                    ],),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Align( alignment: Alignment.bottomRight,
                                          child: Text(items[index].timestamp.toString())),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //                                                            TAB 2
                  Container(
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: <Widget> [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 6.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text("Ryan"),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 6.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text("Edi"),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 6.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text("Arya"),
                            ),
                          ),
                        ],
                      )
                  )
                ]),
              )
            ],
          ),
        )
    );
  }
}
