import 'package:flutter/material.dart';

class HomeDanhmucButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final bool isboder;
  final VoidCallback? click;

  const HomeDanhmucButton({
    super.key,
    required this.text,
    required this.textColor,
    this.click,
    required this.buttonColor,
    required this.isboder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: click,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
          border: isboder
              ? Border.all(color: Color(0xffd3cece), width: 1)
              : null, // nếu false thì không có border
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 11)),
      ),
    );
  }
}
