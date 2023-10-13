import 'package:assignmentluvit/data/models/single_user.dart';
import 'package:assignmentluvit/presentation/blocs/bloc.dart';
import 'package:assignmentluvit/presentation/widgets/top_bar.dart';
import 'package:assignmentluvit/presentation/widgets/user_card.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/event.dart';
import '../blocs/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetDataBloc getDataBloc;
  late PageController _pageController;
  List<SingleUser> users = [];

  @override
  void initState() {
    super.initState();
    getDataBloc = context.read<GetDataBloc>();
    getDataBloc.add(GetData());
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.88,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0C0D),
      body: SafeArea(
        child: BlocConsumer<GetDataBloc, GetDataState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetDataLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white70,
                ),
              );
            } else if (state is GetDataError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              );
            } else if (state is GetDataSuccess) {
              users = state.singleUsers;
              return Column(
                children: [
                  /// top bar
                  const TopBar(),

                  /// Main Body
                  const SizedBox(height: 8),
                  if (users.isNotEmpty) ...[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              UserCard(
                                user: users[index],
                                onUserRemoved: () {
                                  getDataBloc.add(RemoveUser(index: index));
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                  if (users.isEmpty) ...[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.32,
                        ),
                        const Text(
                          '추천 드릴 친구들을 준비 중이에요',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFBFBFB),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '매일 새로운 친구들을 소개시켜드려요',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),

      /// Bottom Bar
      bottomNavigationBar: ConvexAppBar(
        curveSize: 0,
        top: -26,
        height: 60,
        style: TabStyle.fixedCircle,
        activeColor: const Color(0xFFFF016B),
        backgroundColor: Colors.black,
        shadowColor: const Color(0xFF3a3a3a),
        elevation: 4,
        disableDefaultTabController: true,
        onTabNotify: (int i) => false,
        items: [
          TabItem(
              icon: SvgPicture.asset('assets/svgs/home_icon.svg'), title: '홈'),
          TabItem(
              icon: SvgPicture.asset('assets/svgs/location_icon.svg'),
              title: '스팟'),
          TabItem(
              icon: SvgPicture.asset(
            'assets/svgs/star_icon.svg',
            fit: BoxFit.cover,
          )),
          TabItem(
              icon: SvgPicture.asset('assets/svgs/message_icon.svg'),
              title: '채팅'),
          TabItem(
              icon: SvgPicture.asset('assets/svgs/profile_icon.svg'),
              title: '마이'),
        ],
        onTap: (int i) {},
      ),
    );
  }
}
