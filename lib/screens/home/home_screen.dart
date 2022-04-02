
import 'package:az_sencs/shared/components/components.dart';
import 'package:az_sencs/shared/cubit/cubit/master_cubit.dart';
import 'package:az_sencs/shared/cubit/states/master_states.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/components/constants.dart';
import '../admin/users.dart';
import '../profile/profile_screen.dart';
import 'activities/activities.dart';
import 'az_sencs/az_scncs_screen.dart';
import 'committees/committees.dart';
import 'communications/communications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -50).animate(CurvedAnimation(
        parent: _controller2, curve: Curves.fastLinearToSlowEaseIn));

    _controller.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return BlocConsumer<MasterCubit, MasterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: buildAppBar(context),
          body: Stack(
            children: [
              // background color
              const MyBackgroundColor(),

              /// ListView
              ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  SizedBox(height: _w / 5.5),
                  card(
                      'AZ_SENCS',
                      'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/az_sencs.jpg?alt=media&token=ad6f94b4-5ee3-41d9-804c-c0123085e6d6',
                      const AzSenScreen()),
                  card(
                      'Committees',
                      'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/tech.jpg?alt=media&token=c9708aa5-be84-4011-a852-706caf3583a4',
                      const CommitteesScreen()),
                  card(
                      'Activities',
                      'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/Technical.png?alt=media&token=c5b151a7-a966-41e5-a9df-c3c22ae91a93',
                      const ActivitiesScreen()),
                  card(
                      'Communications ',
                      'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/communications.jpeg?alt=media&token=2033fa55-296d-4e93-a727-fcad11a4b28d',
                      uId == 'WT9QhbcxU5aZFe9R9KEpVOI62Jq2'
                          ? const ChatUsersScreen()
                          : ChatDetailsWithAdmin()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return appBar(
          context,
          const ProfileScreen(),
         'Welcome to Az_SENCS :)',
          uId != 'WT9QhbcxU5aZFe9R9KEpVOI62Jq2' ? true : false,
          false,
        );
  }

  Widget card(String title, String image, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return opacity(_w, route, image, title);
  }

  Opacity opacity(double _w, Widget route, String image, String title) {
    return Opacity(
    opacity: _animation.value,
    child: Transform.translate(
      offset: Offset(0, _animation2.value),
      child: container(_w, route, image, title),
    ),
  );
  }

  Container container(double _w, Widget route, String image, String title) {
    return Container(
        height: _w / 2.3,
        width: _w,
        padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                    color: Colors.white.withOpacity(.1), width: 1)),
            child: Padding(
              padding: EdgeInsets.all(_w / 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: _w / 3,
                    width: _w / 3,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: CachedNetworkImageProvider(
                        image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: _w / 40),
                  SizedBox(
                    width: _w / 2.05,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'MyFont',
                            color: Colors.white,
                            fontSize: _w / 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 1,
                          ),
                        ),
                        Text(
                          '',
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(1),
                            fontSize: _w / 25,
                            fontFamily: 'MyFont',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Tap to know more',
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'MyFont',
                            color: Colors.white,
                            fontSize: _w / 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
