import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../homepage.dart';

class OrderDetail extends StatefulWidget {
  final int id;
  final String name;
  final String parse;

  OrderDetail({required this.id, required this.name, required this.parse});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    List<dynamic> itemList = json.decode(widget.parse);
    List<Map<String, dynamic>> fetchedItems = [];

    for (var item in itemList) {
      var response = await http.get(Uri.parse('http://192.168.1.3:8000/api/menu/${item['item_id']}'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        fetchedItems.add({
          'title': data['title'],
          'price': data['price'],
        });
      }
    }

    setState(() {
      items = fetchedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => runApp(MyApp()),
          ),
          title: Text('Order Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order ID: ${widget.id}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('Total Harga: ${widget.name}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('Makanan :', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Expanded(
                child: items.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        'Title: ${item['title']}, Price: ${item['price']}',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
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
