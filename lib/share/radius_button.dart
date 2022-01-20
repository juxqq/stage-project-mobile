import 'package:flutter/material.dart';

class RadiusButton extends StatelessWidget {
  final Function() action;
  final String text;
  final Color color;

  const RadiusButton(this.text, this.action, this.color, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30),
      child: ElevatedButton(onPressed: action,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
          ),
        ),
        child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40)
          ),
          child: Center(
            child: Text(text,
                style: const TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        ),
      ),
    );
  }
}