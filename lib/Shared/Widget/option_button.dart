import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton({required this.function, required this.img});
  var function;
  var img;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      customBorder: CircleBorder(),
      splashColor: Colors.grey,
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            img,
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }
}
