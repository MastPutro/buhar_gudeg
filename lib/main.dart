import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(Login());
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
            height: 551,
            width: 600,
            color: Colors.white,
            child: Column(
              children: <Widget> [
                Image.asset('images/icon.png', width: 300, ),
                Text('Username :', style: TextStyle(fontSize: 20.0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Input Username',

                    ),
                  ),
                ),
                Text('Password :', style: TextStyle(fontSize: 20.0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Input Password',
                    ),
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
                    runApp(MyApp());
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
//              END LOGIN
