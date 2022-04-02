import 'package:az_sencs/shared/components/components.dart';
import 'package:az_sencs/shared/components/constants.dart';
import 'package:az_sencs/shared/styles/icon_broken.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../show_expanded_photo/expanded_photo.dart';

class GridView1 extends StatelessWidget {
  const GridView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context, null, 'Archive'),
      body: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.only(top: 90),
        child: AnimationLimiter(
          child: GridView.count(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.all(_w / 60),
            crossAxisCount: columnCount,
            children: List.generate(
              archive.length,
              (int index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: columnCount,
                  child: ScaleAnimation(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: _w / 30, left: _w / 60, right: _w / 60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {
                            navigateTo(
                              context,
                              ShowExpandedPhoto(index),
                            );
                          },
                          child: Image(
                            image: CachedNetworkImageProvider(
                              archive[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
