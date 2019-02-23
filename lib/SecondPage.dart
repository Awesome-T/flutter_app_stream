import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_stream/GlobalValues.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  StreamController controller;

  @override
  Widget build(BuildContext context) {

    controller = GlobalValues.of(context).controller;

    return Scaffold(
      appBar: AppBar(title: Text("second"),),
      body: StreamBuilder(
        initialData: " * * *",
        stream: controller.stream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlobalValues.of(context).provider.getText(snapshot, context),
                GlobalValues.of(context).provider.getButton(context, "home"),
              ],
            ),
          );
        }
      )
    );
  }
}
