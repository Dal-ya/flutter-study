import 'package:flutter/material.dart';

class EmailButton extends StatelessWidget {
  const EmailButton({
    super.key,
    required this.title,
    required this.idx,
    this.width,
    this.height,
    this.onPressed,
  });

  final String title;
  final int idx;
  final double? width;
  final double? height;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
