import 'package:az_sencs/screens/home/committees/technical/android_screen.dart';
import 'package:az_sencs/screens/home/committees/technical/embedded_system_screen.dart';
import 'package:az_sencs/screens/home/committees/technical/flutter_screen.dart';
import 'package:az_sencs/screens/home/committees/technical/java_screen.dart';
import 'package:az_sencs/screens/home/committees/technical/ml_screen.dart';
import 'package:az_sencs/screens/home/committees/technical/testing_screen.dart';
import 'package:az_sencs/screens/home/committees/technical/web_screen.dart';
import 'package:az_sencs/shared/components/components.dart';
import 'package:az_sencs/shared/styles/icon_broken.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'operation/hr_screen.dart';
import 'operation/marketing_screen.dart';
import 'operation/media_screen.dart';
import 'operation/org_screen.dart';
import 'operation/pr_screen.dart';
import 'operation/r_d_screen.dart';

class CommitteesScreen extends StatefulWidget {
  const CommitteesScreen({Key? key}) : super(key: key);

  @override
  _CommitteesScreenState createState() => _CommitteesScreenState();
}

class _CommitteesScreenState extends State<CommitteesScreen>
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  IconBroken.arrowLeft_2,
                ),
              ),
              pinned: true,
              snap: true,
              floating: true,
              title: const Text('Info about Committees'),
              centerTitle: true,
              backgroundColor: Colors.white12,
              bottom: TabBar(
                indicatorColor: Colors.black.withOpacity(.8),
                unselectedLabelStyle:
                    TextStyle(color: Colors.black.withOpacity(.5)),
                unselectedLabelColor: Colors.black.withOpacity(.4),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black.withOpacity(.8),
                tabs: const [
                  Tab(
                    child: Text(
                      'Operations',
                      style: TextStyle(
                        fontFamily: 'MyFont',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Technicals',
                      style: TextStyle(
                        fontFamily: 'MyFont',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              mainCardOperation(context),
              mainCardTechnical(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainCardOperation(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // background color
        const MyBackgroundColor(),

        /// ListView
        ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: _w / 5.5),
            defaultCard(
              title: 'Human Resources',
              subtitle: 'HR.',
              route: const HrScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/hr.jpg?alt=media&token=5b1c59b5-04cd-415a-9c2a-6809fe2a212e',
            ),
            defaultCard(
              title: 'Public Relations',
              subtitle: 'PR.',
              route: const PrScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/pr.jpg?alt=media&token=128e0a2c-af6b-429b-909d-c59b9b5cfa4d',
            ),
            defaultCard(
              title: 'Media',
              subtitle: '',
              route: const MediaScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/media.jpg?alt=media&token=ca8564e5-dd0f-4a5a-8bca-b30bd9bd72ff',
            ),
            defaultCard(
              title: 'Marketing ',
              subtitle: '',
              route: const MarketingScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/marketing.jpg?alt=media&token=9b3f3393-a338-46c3-8d3d-1f101096cfe9',
            ),
            defaultCard(
              title: 'Organization ',
              subtitle: 'ORG.',
              route: const OrgScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/org.jpg?alt=media&token=e87a9518-3c2c-48b4-bac2-76bc6f8d64cb',
            ),
            defaultCard(
              title: 'Research & Dev.',
              subtitle: 'R. & D. ',
              route: const RDScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/s_d.jpg?alt=media&token=c4c43e9c-5687-4961-b824-9ea375f2efa0',
            ),
          ],
        ),
      ],
    );
  }

  Widget mainCardTechnical(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // background color
        const MyBackgroundColor(),

        /// ListView
        ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: _w / 5.5),
            defaultCard(
              title: 'Android ',
              subtitle: '',
              route: const AndroidScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/android.jpg?alt=media&token=3940192a-fcde-45d6-959b-dc2db50aba98',
            ),
            defaultCard(
              title: 'Flutter',
              subtitle: '',
              route: const FlutterScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/flutter.jpg?alt=media&token=215e0b32-2dc6-4ee8-b9a9-4eff350f9a62',
            ),
            defaultCard(
              title: 'WEB',
              subtitle: '',
              route: const WebScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/web.jpg?alt=media&token=3d868b37-8469-4cf3-807f-a6146ce71c59',
            ),
            defaultCard(
              title: 'Machine Learning',
              subtitle: 'ML',
              route: const MachineLearningScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/ml.jpg?alt=media&token=5d9a78a7-058b-4fc8-bec8-90d8b51c3bdd',
            ),
            defaultCard(
              title: 'Embedded System ',
              subtitle: '',
              route: const EmbeddedSystemScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/embedded.jpg?alt=media&token=be3c1228-749b-4168-ab5b-5a696033a8f3',
            ),
            defaultCard(
              title: 'Java',
              subtitle: '',
              route: const JavaScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/java.jpg?alt=media&token=2abc374d-7ad8-47f8-bc49-cffccd004bbb',
            ),
            defaultCard(
              title: 'Testing ',
              subtitle: '',
              route: const TestingScreen(),
              image:
                  'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/testing.jpeg?alt=media&token=5397f09a-ef61-4d98-ae4f-c41e143c27ac',
            ),
          ],
        ),
      ],
    );
  }

  Widget defaultCard(
      {required String title,
      required String subtitle,
      required Widget route,
      required String image}) {
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
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        image: CachedNetworkImageProvider(
                          image,
                        ),
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
                            subtitle,
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
