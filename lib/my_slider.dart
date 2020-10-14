import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySlideWidget extends StatefulWidget {
  @override
  MySlideWidgetState createState() => MySlideWidgetState();

  MySlideWidget({Key key}) : super(key: key);
}

class MySlideWidgetState extends State<MySlideWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value.toDouble(),
      min: 0.0,
      max: 100.0,
      label: '$value dollars',
      onChanged: (double newValue) {
        setState(() {
          value = newValue.round();
        });
      },
    );
  }
}
