import 'package:flutter/material.dart';

class LikeCountWidget extends StatelessWidget {
  const LikeCountWidget({required this.likeCount, super.key});

  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Container(
        padding: const EdgeInsets.only(
            left: 6, right: 10, top: 4, bottom: 4),
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                width: 1, color: Color(0xFF202020)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.75, -0.67),
                  end: Alignment(-0.75, 0.67),
                  colors: [
                    Color(0xFFFF006B),
                    Color(0xFFFF4593)
                  ],
                ),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0,
                  pointRounding: 1,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              likeCount.toString(),
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
