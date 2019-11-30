import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi primera aplicación"),
      ),
      body: Stack(
        children: <Widget>[
          Counter(),
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count;
  @override
  void initState() {
    // TODO: implement initState
    count = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Haz dado $count taps."),
          RaisedButton(
            child: Text("Tap"),
            onPressed: (){
              setState(() {
                count++;
              });
            }
          ),
        ],
      ),
    );
  }
}
