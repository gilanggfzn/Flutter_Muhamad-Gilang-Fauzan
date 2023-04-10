import 'package:flutter/material.dart';

class ButtonCustome extends StatelessWidget {
  final Function()? onPressed;

  final String? title;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const ButtonCustome({
    super.key,
    required this.onPressed,
    this.title,
    this.icon,
    this.padding, 
    this.backgroundColor, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          backgroundColor: backgroundColor
        ) ,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? "-",
            )
          ],
        ),
      ),
    );
  }
}