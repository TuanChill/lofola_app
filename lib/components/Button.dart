import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry paddingInside;
  final EdgeInsetsGeometry paddingOutside;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final bool? isMaxWidth;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.borderRadius = 8.0,
    this.elevation = 2.0,
    this.paddingInside =
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    this.paddingOutside = const EdgeInsets.symmetric(horizontal: 0.0),
    this.icon,
    this.iconColor,
    this.iconSize,
    this.isMaxWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingOutside,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: paddingInside,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize:
              isMaxWidth == true ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: iconColor ?? textColor,
                size: iconSize,
              ),
            if (icon != null) const SizedBox(width: 8.0),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
