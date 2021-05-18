import 'package:example/Widgets/Styles/TextWidgetStyles.dart';
import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String value;
  final TextStyle style;
  final TextAlign align;
  TextWidget(this.value, {this.style, this.align});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value,
        textAlign: align ?? TextAlign.center,
        style: style ?? TWStyle.defaulttWStyle,
      ),
    );
  }
}
