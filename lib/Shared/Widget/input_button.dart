import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/input_button_model.dart';

class InputButton extends StatelessWidget {
  InputButton({required this.inputButtonModel});
  InputButtonModel inputButtonModel;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width / 5.1;
    return CupertinoButton(
padding: EdgeInsets.zero,
      onPressed: inputButtonModel.function,
      child: Container(
        alignment: Alignment.center,
        height: w,
        width: w,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: inputButtonModel.backgroundcolor),
        child: Text(
          inputButtonModel.text,
          style: TextStyle(color: inputButtonModel.color,
              fontSize: inputButtonModel.fontSize),
        ),
      ),
    );
  }
}
