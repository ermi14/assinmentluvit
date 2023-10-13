import 'package:assignmentluvit/data/models/single_user.dart';
import 'package:assignmentluvit/presentation/widgets/custom_chips.dart';
import 'package:assignmentluvit/presentation/widgets/like_count_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    required this.user,
    required this.onUserRemoved,
    super.key,
  });

  final SingleUser user;
  final VoidCallback onUserRemoved;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late String currentImage;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    currentImage = widget.user.images[0] as String;
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white30,
          width: 0.3,
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(currentImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black87,
                    Colors.black54,
                    Colors.black26,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  selectedImageIndicator(
                    widget.user.images.length,
                    selectedIndex,
                  ),
                  const Spacer(),
                  LikeCountWidget(likeCount: widget.user.likeCount),
                  const SizedBox(height: 6),
                  personalInfo(),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: selectedIndex > 2
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (selectedIndex == 0) ...[
                        address(),
                        const SizedBox(height: 2),
                      ],
                      if (selectedIndex == 1) ...[
                        description(),
                        const SizedBox(height: 2),
                      ],
                      if (selectedIndex == 2) ...[
                        Expanded(
                          child: tagChips(),
                        ),
                        const SizedBox(height: 2),
                      ],
                      Stack(
                        children: [
                          SvgPicture.asset('assets/svgs/circle.svg'),
                          Positioned(
                            left: 12,
                            top: 12,
                            child: SvgPicture.asset('assets/svgs/heart.svg'),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFFD9D9D9),
                        size: 18,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                if (selectedIndex < widget.user.images.length - 1) {
                  setState(() {
                    selectedIndex = selectedIndex + 1;
                    currentImage = widget.user.images[selectedIndex] as String;
                  });
                }
              },
              child: ColoredBox(
                color: Colors.transparent,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.86) / 2,
                  width: (MediaQuery.of(context).size.width * 0.42),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                if (selectedIndex > 0) {
                  setState(() {
                    selectedIndex = selectedIndex - 1;
                    currentImage = widget.user.images[selectedIndex] as String;
                  });
                }
              },
              child: ColoredBox(
                color: Colors.transparent,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.86) / 2,
                  width: (MediaQuery.of(context).size.width * 0.42),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onPanEnd: (details) async {
                if (details.velocity.pixelsPerSecond.dx > 0 ||
                    details.velocity.pixelsPerSecond.dy < 0) {
                  widget.onUserRemoved();

                  await Future.delayed(const Duration(milliseconds: 200));
                  selectedIndex = 0;
                  currentImage = widget.user.images[selectedIndex] as String;

                  setState(() {});
                }
              },
              child: ColoredBox(
                color: Colors.transparent,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.64) / 2,
                  width: (MediaQuery.of(context).size.width),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tagChips() {
    List<Widget> children = [];
    for (int i = 0; i < widget.user.tags.length; i++) {
      children.add(CustomChips(
        icon: const Icon(
          Icons.camera,
          color: Colors.white60,
          size: 18,
        ),
        text: widget.user.tags[i] as String,
      ));
    }
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: children,
    );
  }

  Widget description() {
    return Text(
      widget.user.description,
      style: const TextStyle(
        color: Color(0xFFD9D9D9),
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget address() {
    return Row(
      children: [
        Text(
          widget.user.location,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Color(0xFFD9D9D9),
          ),
        ),
        const SizedBox(width: 2),
        const Text(
          '2 KM',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget personalInfo() {
    return Row(
      children: [
        Text(
          widget.user.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          widget.user.age.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget selectedImageIndicator(int count, int selectedIndex) {
    List<Widget> indicators = [];
    for (int i = 0; i < count; i++) {
      indicators.add(
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 3,
            decoration: BoxDecoration(
              color: i == selectedIndex
                  ? const Color(0xFFFF006B)
                  : const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: indicators,
      ),
    );
  }
}
