
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState(){
    super.initState();
  }
 @override
  void dispose(){
    super.dispose();
    password.dispose();
    username.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
                  child: Image.asset('images/icon.png', width: 300, ),
                ),
                Padding(padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username'
                    ),
                  ),),
                Padding(padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password'
                    ),
                  ),),
                Padding(padding: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Map creds = {
                              'email' : username.text,
                              'password' : password.text,
                              'device' : 'mobile',
                            };
                            if (username != null && password != null) {
                             print(creds);
                             runApp(MyApp());
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


