import 'package:axios_flutter_utilities/ConnectivityService/ConnectivityService.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectivityService _connectivity = ConnectivityService.instance;

  var _source;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Internet")),
      body: Center(
          child: Text(_source.toString(), style: TextStyle(fontSize: 36))),
    );
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }
}
