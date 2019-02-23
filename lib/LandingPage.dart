import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_stream/FirstPage.dart';
import 'package:flutter_app_stream/GlobalValues.dart';
import 'package:flutter_app_stream/TestBloc.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  StreamController ctrl;
  TestBloc bloc = TestBloc();

  int counter = 0;

  @override
  Widget build(BuildContext context) {

    if(counter == 0){
      // GlobalValues.of(context).initStream();
      ctrl = StreamController.broadcast();
      ctrl.addStream(bloc.getPeriodicStream());
      counter++;
    }

    GlobalValues.of(context).controller = ctrl;

    return Scaffold(
        appBar: AppBar(title: Text("landing"),),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("start stream"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                },
              )
            ],
          ),
        )
    );
  }
}
