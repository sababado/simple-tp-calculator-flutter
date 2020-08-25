import 'package:calc_package/calculator.dart';
import 'package:flutter/material.dart';

import 'CustomInputField.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(title: 'Simple TP Calculator'),
      home: Scaffold(
        appBar: AppBar(title: Text('Simple TP Calculator')),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final calculator = new Calculator();
  String _dayCalculation = "0";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          CustomInputField("tpr", "TPRs", "Toilet Paper Rolls", (text) {
            calculator.tprs = text.isNotEmpty ? int.parse(text) : 0;
            _updateResult();
          }),
          CustomInputField("spr", "SPR", "Sheets per Roll", (text) {
            calculator.spr = text.isNotEmpty ? int.parse(text) : 0;
            _updateResult();
          }),
          CustomInputField(
              "avgSps", "Avg. SPS", "Average Sheets per Bathroom Usage",
              (text) {
            calculator.avgSps = text.isNotEmpty ? int.parse(text) : 0;
            _updateResult();
          }),
          CustomInputField(
              "burts", "BURTs per Day", "Bathroom Usages Requiring TP", (text) {
            calculator.burts = text.isNotEmpty ? int.parse(text) : 0;
            _updateResult();
          }),
          Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    _dayCalculation.toString(),
                    style: TextStyle(fontSize: 32.0),
                    key: Key("dos-value"),
                  ),
                ),
                Center(
                  child: Text(
                    "Days",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _updateResult() {
    setState(() {
      _dayCalculation = calculator.calculateAsString();
    });
  }
}
