import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      ),
      body: Column(
        children: [
          TabBar(
              tabs: [
            Tab(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: double.infinity,
                  minWidth: double.infinity
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text('Catering'),
                ),
              ),
            ),
            Tab(
              child: Container(
                constraints: BoxConstraints(
                    minHeight: double.infinity,
                    minWidth: double.infinity
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text('Eat Here'),
                ),
              ),
            ),
            Tab(
              child: Container(
                constraints: BoxConstraints(
                    minHeight: double.infinity,
                    minWidth: double.infinity
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text('Transaction'),
                ),
              ),
            ),
          ],
            indicator: BoxDecoration(
              color: Color(0xff3092f3),
              borderRadius: BorderRadius.circular(20),
            ),
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Expanded(
            child: TabBarView(children: [
              //                                                                  TAB KATERING
              Container(
                child: ListView(
                  padding: EdgeInsets.all(8),
                  children: <Widget> [
                    Padding(padding: EdgeInsets.all(8),
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                          color: Color(0xffd7d7d7),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                            color: Color(0xffc7c7c7),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                child: Text('Tab 2'),
              ),
              Container(
                child: Text('Tab 3'),
              ),
            ]),
          )
        ],
      ),
    ));
  }
}
