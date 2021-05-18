import 'package:axios_flutter_utilities/ConnectivityService/ConnectivityService.dart';
import 'package:example/Core/DataModels.dart';
import 'package:example/Widgets/ContainerWidgets.dart';
import 'package:example/Widgets/Styles/TextWidgetStyles.dart';
import 'package:example/Widgets/TextWidgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MultiSelectFormPage()));

class MultiSelectFormPage extends StatefulWidget {
  final List list;
  MultiSelectFormPage({this.list});
  @override
  _MultiSelectFormPageState createState() => _MultiSelectFormPageState();
}

class _MultiSelectFormPageState extends State<MultiSelectFormPage> {
  ConnectivityService _connectivity = ConnectivityService.instance;

  var _source;

  @override
  void initState() {
    super.initState();
    // _connectivity.initialise();
    // _connectivity.myStream.listen((source) {
    //   setState(() => _source = source);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Internet")),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget("Select an option for your life:",
                style: TWStyle.customtWStyle(fontSize: 24, color: Colors.blue)),
            ListView(
              shrinkWrap: true,
              children: (widget?.list ?? exampleOptions)
                  .map((e) => SelectableContainer(
                        e,
                        selectedColor: Colors.green,
                        onTap: (bool isSelected) {},
                      ))
                  .toList(),
            ),
          ],
        )));
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }
}
