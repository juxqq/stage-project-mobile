import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final Function() action;
  final String text;
  final Color color;

  const SettingsButton(this.text, this.action, this.color, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
        onPressed: action,
        height: 45,
        color: color,
        minWidth: 100,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}