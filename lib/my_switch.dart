import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySwitch extends StatefulWidget {

  final String text;
  MySwitch({Key key, this.text}): super(key:key);

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _value = true;

  @override
  void initState() {
    super.initState();
    print('${widget.text} initstate');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Switch(
            value: _value,
            onChanged: (newValue) {
              setState(() {
                _value = newValue;
              });
            },
            activeColor: Colors.red,
            activeTrackColor:Colors.black,
            inactiveThumbColor:Colors.green,
            inactiveTrackColor: Colors.blue,
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
