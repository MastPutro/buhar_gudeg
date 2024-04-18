import 'package:buhar_gudeg/history.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    CateringPage(),
    History(),
    MenuPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Ordered',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
class CateringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dahsboard(),
    );
  }
}

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HistoryTab(),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu Page'),
    );
  }
}
//                                                                              DASHBOARD
class Dahsboard extends StatelessWidget {
  const Dahsboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.store_mall_directory),
                  ),
                  Tab(
                    icon: Icon(Icons.delivery_dining),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  //                                                            TAB 1
                  Scaffold(
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        //                                                      FUNGSI FLOAT BUTTON
                      },
                      child: const Icon(Icons.add),
                    ),
                    body: Container(
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
                              child: Text("Meja 1"),
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
                              child: Text("Meja 2"),
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
                              child: Text("Meja 3"),
                            ),
                          ),
                        ],
                      )
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