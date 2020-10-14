import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo/my_slider.dart';

class TestGlobalKeyParentPage extends StatefulWidget {
  @override
  _TestGlobalKeyParentPageState createState() =>
      _TestGlobalKeyParentPageState();
}

class _TestGlobalKeyParentPageState extends State<TestGlobalKeyParentPage> {
  GlobalKey<MySlideWidgetState> key;

  @override
  void initState() {
    key = GlobalKey<MySlideWidgetState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GlobalKey访问状态'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MySlideWidget(key: key),
                  RaisedButton(
                    child: Text('获取滑块位置'),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  Text('当前滑块位置为 ${key.currentState?.value}')
                ],
              ),
            ],
          ),
        ));
  }
}
