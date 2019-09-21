import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jelly/jelly.dart';

import 'utils/raised_gradient_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  int jellyCount = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Jelly(
                jellyCount,
                size: Size(400, 400),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48, right: 48),
                child: RaisedGradientButton(
                  child: Text(
                    "Increase layer",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  colors: [
                    Color.fromARGB(255, 172, 131, 241),
                    Color.fromARGB(255, 241, 244, 247)
                  ],
                  onPressed: () => increaseJelly(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 48, right: 48),
                child: RaisedGradientButton(
                  child: Text(
                    "Decrease layer",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  colors: [
                    Color.fromARGB(255, 240, 69, 7),
                    Color.fromARGB(255, 255, 164, 43)
                  ],
                  onPressed: () => decreaseJelly(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  // Here i am playing around in jelly on text change of email
  increaseJelly() {
    setState(() {
      jellyCount = jellyCount + 1;
    });
  }

  decreaseJelly() {
    setState(() {
      if (jellyCount > 1) {
        jellyCount = jellyCount - 1;
      }
    });
  }
}
