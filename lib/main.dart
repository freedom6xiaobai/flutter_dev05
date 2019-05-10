import 'package:flutter/material.dart';
import 'MyPage.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(), // becomes the route named '/'
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => MyPage(title: 'page A'),
      '/b': (BuildContext context) => MyPage(title: 'page B'),
      '/c': (BuildContext context) => MyPage(title: 'page C'),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: Builder(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('自定义跳转/资源配置'),
                ),
                body: Center(
                    child: FlatButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPage(title: 'page')));
                  },
                  icon: Icon(Icons.add),
                  label: Text("点击"),
                  color: Colors.yellow,
                )),
              ),
        ));
  }
}
