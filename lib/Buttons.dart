
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  @required Function onpress;
  @required String ButtonText;
  @required Color ButtonColor;

  Buttons({this.onpress, this.ButtonText, this.ButtonColor});


  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color.fromRGBO(38, 37, 37, 1.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
      ),
        onPressed:(){
        onpress(ButtonText);
        },
        child: Text(
          ButtonText,
          style: TextStyle(
          color: ButtonColor,
          fontSize: 20,
        ),),

    );
  }
}
