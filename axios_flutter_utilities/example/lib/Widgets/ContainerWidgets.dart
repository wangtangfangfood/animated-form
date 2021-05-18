import 'package:example/Widgets/Styles/TextWidgetStyles.dart';
import 'package:example/Widgets/TextWidgets.dart';
import 'package:flutter/material.dart';

class SelectableContainer extends StatefulWidget {
  final String text;
  final Duration duration;
  final Color selectedColor;
  final Color unselectedColor;
  final Function onTap;
  Color color;

  SelectableContainer(
    this.text, {
    @required this.onTap,
    this.duration,
    this.selectedColor,
    this.unselectedColor,
  }) {
    color = unselectedColor;
  }

  @override
  _SelectableContainerState createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  bool isSelected = false;
  Color color;

  void initState() {
    color = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 0, vertical: isSelected ? 10 : 0),
      padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16 : 0, vertical: isSelected ? 4 : 0),
      duration: widget.duration ?? Duration(milliseconds: 750),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
          color: getColor(isSelected).withOpacity(0.6),

          // gradient: isSelected
          //     ? LinearGradient(colors: [
          //         getColor(isSelected).withOpacity(0.6),
          //         Colors.red[800]
          //       ])
          //     : LinearGradient(colors: [Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(isSelected ? 8 : 0),
          boxShadow: [
            BoxShadow(
                color: isSelected ? Colors.grey[400] : Colors.transparent,
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(2, 4))
          ]
          // shape: isSelected ? BoxShape.circle : BoxShape.rectangle
          ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextWidget(
                widget.text,
                style: TWStyle.customtWStyle(color: getTextColor(isSelected)),
              ),
            ),
          ],
        ),
        onTap: () {
          if (mounted)
            setState(() {
              isSelected = !isSelected;
            });
          widget.onTap(isSelected);
        },
      ),
    );
  }

  Color getColor(bool isSelected) => (isSelected ?? false)
      ? (widget?.selectedColor ?? Colors.blue)
      : (widget?.unselectedColor ?? Colors.white);

  Color getTextColor(bool isSelected) =>
      !(isSelected ?? false) ? (Colors.black54) : (Colors.white);
}
