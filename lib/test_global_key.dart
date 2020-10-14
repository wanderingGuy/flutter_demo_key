import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo/my_slider.dart';

class TestGlobalKeyPage extends StatefulWidget {
  @override
  _TestGlobalKeyPageState createState() => _TestGlobalKeyPageState();
}

class _TestGlobalKeyPageState extends State<TestGlobalKeyPage> {
  Key _key;
  bool isShowSlide = true;

  @override
  void initState() {
    _key = GlobalKey(debugLabel: 'my_slide_key');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GlobalKey测试'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      '当前key类型 ${_key is GlobalKey ? 'GlobalKey' : 'LocalKey'}'),
                  isShowSlide ? MySlideWidget(key: _key) : Container(),
                  Column(
                    children: [
                      RaisedButton(
                        child: Text('切换 slide 状态'),
                        onPressed: () {
                          setState(() {
                            isShowSlide = !isShowSlide;
                          });
                        },
                      ),
                      RaisedButton(
                        child: Text('使用LocalKey'),
                        onPressed: () {
                          setState(() {
                            _key = ValueKey('my_slide_key');
                          });
                        },
                      ),
                      RaisedButton(
                        child: Text('使用GlobalKey'),
                        onPressed: () {
                          setState(() {
                            _key = GlobalKey(debugLabel: 'my_slide_key');
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              !isShowSlide ? MySlideWidget(key: _key) : Container(),
            ],
          ),
        ));
  }
}
