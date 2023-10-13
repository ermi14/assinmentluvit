import 'package:assignmentluvit/presentation/widgets/like_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: SvgPicture.asset(
                  'assets/svgs/location_icon.svg',
                  color: Colors.white54,
                ),
              ),
              const SizedBox(width: 2),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '목이길어슬픈기린',
                      style: TextStyle(
                        color: Color(0xFFFBFBFB),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '님의 새로운 ',
                      style: TextStyle(
                        color: Color(0xFFFBFBFB),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: '스팟',
                      style: TextStyle(
                        color: Color(0xFFFBFBFB),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LikeCountWidget(likeCount: 323233),

              /// Notification
              SizedBox(
                width: 28,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      right: 2,
                      top: 9,
                      child: SizedBox(
                        width: 20,
                        height: 22,
                        child: SvgPicture.asset(
                          'assets/svgs/notification_icon.svg',
                          color: Colors.white54,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      top: 6,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFE90000),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
