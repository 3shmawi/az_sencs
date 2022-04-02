import 'package:az_sencs/models/user_model.dart';
import 'package:az_sencs/shared/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit/master_cubit.dart';
import '../../shared/cubit/states/master_states.dart';
import '../../shared/styles/icon_broken.dart';



class ProfileInfoScreen extends StatelessWidget {
 late UserModel userModel;


   ProfileInfoScreen(this.userModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MasterCubit, MasterStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: appBar(
            context,
            null,
            'Profile Screen',
          ),
          body: Stack(
            children: [
              const MyBackgroundColor(),
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0.0,
                    margin: const EdgeInsets.all(
                      8.0,
                    ),
                    color: Colors.white60,
                    child: SizedBox(
                      height: 210.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          const Align(
                            child: Image(
                              image: CachedNetworkImageProvider(
                                'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/onboard1.jpeg?alt=media&token=279839ca-2419-4fc5-ad8e-71856557f65d',
                              ),
                              fit: BoxFit.cover,
                              height: 150.0,
                              width: double.infinity,
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage(
                                '${userModel.image}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${userModel.name}',
                            style: const TextStyle(
                                fontFamily: 'MyFont', fontSize: 20),
                          ),
                          Text(
                            '${userModel.bio}',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(fontFamily: 'MyFont'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30.0,
                              left: 8.0,
                            ),
                            child: Row(
                              children: [
                                const Icon(IconBroken.home),
                                Text(
                                  '  ${userModel.university}',
                                  style: const TextStyle(
                                      fontFamily: 'MyFont', fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              left: 8.0,
                            ),
                            child: Row(
                              children: [
                                const Icon(IconBroken.paper),
                                Text(
                                  '  ${userModel.email}',
                                  style: const TextStyle(
                                      fontFamily: 'MyFont', fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 8.0, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(IconBroken.call),
                                Text(
                                  '  ${userModel.phone}',
                                  style: const TextStyle(
                                    fontFamily: 'MyFont',
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
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
      },
    );
  }
}
