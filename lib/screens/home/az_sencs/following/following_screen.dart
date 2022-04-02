
import 'package:az_sencs/shared/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/network/remote/open_link_handler.dart';

class FollowingAzSenScreen extends StatelessWidget {
  const FollowingAzSenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(
        context,
        const RouteWhereYouGo(),
        'follow us now ',
      ),
      body: Stack(
        children: [
          const MyBackgroundColor(),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0, left: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      item(
                        url: 'https://www.facebook.com/AZSENCS',
                        image:
                            'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/facebook.png?alt=media&token=dd5f93fb-ca37-4602-ad76-a88c2ad98e29',
                        title: 'Facebook',
                      ),
                      item(
                        url: 'https://www.linkedin.com/company/az-sencs',
                        image:
                            'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/linkedin.png?alt=media&token=d8b16a87-d772-43fe-bd40-44eb0533058d',
                        title: 'Linkedin',
                      ),
                      item(
                        url: 'https://twitter.com/Az_SENCS',
                        image:
                            'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/twitter.png?alt=media&token=7c25062b-dfbb-4933-af5e-add65fa865b9',
                        title: 'Twitter',
                      ),
                      item(
                        url: 'https://www.instagram.com/az_sencs/',
                        image:
                            'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/instagram.png?alt=media&token=3d59b1e4-4c4d-460e-8ac8-ccb81ce2dbe9',
                        title: 'Instagram',
                      ),
                      item(
                        url:
                            'https://www.youtube.com/channel/UCG0F7N-gR38QBDCbKYay7YQ',
                        image:
                            'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/youtube%20.png?alt=media&token=1bd9000f-11f1-4639-af42-17874e34cfee',
                        title: 'Youtube',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget item({
    required String url,
    required String image,
    required String title,
  }) =>
      InkWell(
        onTap: () {
          UrlHandler.open(url);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 19,
                backgroundImage: CachedNetworkImageProvider(
                  image,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontFamily: 'MyFont', fontSize: 20),
            ),
          ],
        ),
      );
}
