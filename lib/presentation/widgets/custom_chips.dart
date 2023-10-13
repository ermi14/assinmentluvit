import 'package:flutter/material.dart';

class CustomChips extends StatelessWidget {
  const CustomChips({
    required this.icon,
    required this.text,
    super.key,
  });

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 10, top: 4, bottom: 4),
        decoration: ShapeDecoration(
          color: Colors.black45,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF202020)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFFBFBFB),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
