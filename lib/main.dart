import 'package:flutter/material.dart';

void main() {
  runApp(const Tabbar());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: 515,
            width: 600,
            color: Colors.white,
            child: Column(
              children: <Widget> [
                Image.asset('images/icon.png', width: 300, ),
                Text('Username :', style: TextStyle(fontSize: 20.0),),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Input Username',

                  ),
                ),
                Text('Password :', style: TextStyle(fontSize: 20.0),),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Input Password',
                  ),
                ),
                Padding(padding: EdgeInsets.all(20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.blueAccent,
                  ),
                    onPressed: (){
                    /*-FUNGSI BUTTON-*/
                    },
                    child: const Text('Login')),)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//              END LOGIN -> DASHBOARD BEGIN
class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dahsboard(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

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
                  text: "Ditempat",
                ),
                Tab(
                  text: "Katering",
                ),
              ],
              ),
              TabBarView(children: [
                Container(
                  child: ,
                )
              ])
            ],
          ),
        )
    );
  }
}


