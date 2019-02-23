import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_stream/GlobalValues.dart';

class FirstPage extends StatefulWidget {

  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  StreamController controller;

  @override
  Widget build(BuildContext context) {

    controller = GlobalValues.of(context).controller;

    return Scaffold(
      appBar: AppBar(
        title: Text("first"),
      ),
      body: StreamBuilder(
        initialData: " ...",
        stream: controller.stream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlobalValues.of(context).provider.getText(snapshot, context),
                GlobalValues.of(context).provider.getButton(context, "next"),
              ],
            ),
          );
        }),
    );
  }
}