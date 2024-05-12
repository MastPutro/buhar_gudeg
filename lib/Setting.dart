import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 1, child: Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('SETTING', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),),
            Padding(padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),),
            Padding(padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),)
          ],
        ),
      ),
    ));
  }
}
