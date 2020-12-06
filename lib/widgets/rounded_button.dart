import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String labelText;
  final Function onPressedFunction;
  final Color backgroundColor;

  const RoundedButton(
      {@required this.labelText,
      @required this.onPressedFunction,
      @required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        minWidth: 300.0,
        height: 42.0,
        elevation: 5,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        onPressed: onPressedFunction,
        child: Text(labelText),
      ),
    );
  }
}
