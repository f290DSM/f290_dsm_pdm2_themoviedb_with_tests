import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/wave.png',
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(decoration: InputDecoration(filled: true),),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(decoration: InputDecoration(filled: true),),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
