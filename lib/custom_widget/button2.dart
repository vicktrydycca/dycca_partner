
import 'package:dycca_partner/utils/constants.dart';
import 'package:flutter/material.dart';
class Button2 extends StatelessWidget {
  String placeholder;
  bool disabled;
  VoidCallback buttonClickCallback;
  double fontSize;
  Color? color;
  Button2({Key? key,this.color,required this.placeholder, required this.disabled, required this.buttonClickCallback,this.fontSize = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled) {
          buttonClickCallback();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 50),
        child: Container(
          decoration: BoxDecoration(
            color: color ?? primaryColor.withOpacity(1),
            borderRadius: BorderRadius.circular(3.0),
          ),
          height: 56,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                placeholder,
                style: appFontStyle(
                  color: disabled ? neutral4Color : Colors.white.withOpacity(0.9),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
