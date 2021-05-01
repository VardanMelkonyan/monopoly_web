import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class RulesSceeen extends StatefulWidget {
  @override
  _RulesSceeenState createState() => _RulesSceeenState();
}

class _RulesSceeenState extends State<RulesSceeen> {
  List<Widget> widgets = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/Screens/rules.json');
    final data = await json.decode(response);
    setState(() {
      data.forEach((key, value) {
        widgets.add(SizedBox(
          height: 40,
        ));
        widgets.add(Text(
          key,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ));
        widgets.add(SizedBox(
          height: 10,
        ));
        widgets.add(Text(
          value,
          style: TextStyle(fontSize: 18),
        ));
      });
      widgets.add(SizedBox(
        height: 60,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Rules of the game"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          children: widgets,
        ),
      )),
    );
  }
}
