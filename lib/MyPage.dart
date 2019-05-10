import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'MyRefresh.dart';


class MyPage extends StatelessWidget {
  MyPage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: requestData(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SampleAppPage()));
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}

class requestData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return requestDataState();
  }
}

class requestDataState extends State<requestData> {
  List _dataArray = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: _dataArray.length,
        itemBuilder: (BuildContext context, int index) {
          return _getRow(index);
        });
  }

  Widget _getRow(int i) {
    return ListTile(//cell
      title: Text("Row ${_dataArray[i]["title"]}"),
      subtitle: Text("Row ${_dataArray[i]["body"]}"),
      leading: Icon(Icons.widgets),
      trailing: Icon(Icons.remove_red_eye),
    );
    return Padding(//cell
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${_dataArray[i]["title"]}"));
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      _dataArray = json.decode(response.body);
    });
  }
}
