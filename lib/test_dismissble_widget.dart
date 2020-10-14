
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo/my_switch.dart';

class TestDismissiblePage extends StatefulWidget {
  @override
  _TestDismissiblePageState createState() => _TestDismissiblePageState();
}

class _TestDismissiblePageState extends State<TestDismissiblePage> {
  List<String> list = ['aaa', 'bbb', 'ccc', 'ddd', 'eee', 'fff'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocalKey 测试'),
      ),
      // body: _buildStandardList(),
      body: _buildColumnList(),
    );
  }

  _buildColumnList() {
    return Column(
      children: list
          .asMap()
          .map((index, e) => MapEntry(
              index,
              GestureDetector(
                key: ValueKey(list[index]),
                child: MySwitch(text: list[index]),
                onTap: () {
                  setState(() {
                    list.removeAt(index);
                  });
                },
              )))
          .values
          .toList(),
    );
  }

  _buildStandardList() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(list[index]),
          onDismissed: (direction) {
            print('context.widget.key ${context.widget.key}');
            setState(() {
              list.removeAt(index);
            });
          },
          background: Container(color: Colors.red),
          child: MySwitch(text: list[index]),
        );
      },
      itemCount: list.length,
    );
  }
}
