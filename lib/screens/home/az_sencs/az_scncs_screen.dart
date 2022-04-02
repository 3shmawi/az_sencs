import 'package:az_sencs/screens/home/az_sencs/vision_and_message/vision_message_screen.dart';
import 'package:az_sencs/shared/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'archives/archives.dart';
import 'creation_story/creation_story_screen.dart';
import 'following/following_screen.dart';

class AzSenScreen extends StatefulWidget {
  const AzSenScreen({Key? key}) : super(key: key);

  @override
  _AzSenScreenState createState() => _AzSenScreenState();
}

class _AzSenScreenState extends State<AzSenScreen>
    with TickerProviderStateMixin {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(
        context,
        const RouteWhereYouGo(),
        'Info about Az_SENCS',
      ),
      body: Stack(
        children: [
          // background color
          const MyBackgroundColor(),

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: _w / 2.3),
                defaultCard(
                  'Creation Story',
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/creation.png?alt=media&token=4460e043-b980-42cf-9eba-1429819534d9',
                  const CreationStoryScreen(),
                ),
                defaultCard(
                  'Vision ',
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/mission.jpg?alt=media&token=0b0db039-a0c3-4b59-bf2a-04a889bf6554',
                  const VisionAndMessageScreen(),
                ),
                defaultCard(
                  'Archives ',
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/archive.jpg?alt=media&token=2e20aecf-e744-4bde-b9e1-64d47690c502',
                  const GridView1(),
                ),
                defaultCard(
                  'Following us ',
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/follow.jpg?alt=media&token=b5333011-c9a7-423e-8231-0cf35cd52429',
                  const FollowingAzSenScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget defaultCard(String title, String image, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: Container(
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
        ),
      ),
    );
  }
}
