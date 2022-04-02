import 'package:az_sencs/shared/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../shared/cubit/cubit/master_cubit.dart';
import '../../shared/cubit/states/master_states.dart';

import 'chat_with_users.dart';

class ChatUsersScreen extends StatelessWidget {
  const ChatUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MasterCubit, MasterStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = MasterCubit.get(context);

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: appBar(
              context,
              null,
              'users',
            ),
            body: Stack(
              children: [
                const MyBackgroundColor(),
                cubit.chatUsers.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            chatItem(cubit.chatUsers[index], context),
                        separatorBuilder: (context, index) => Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                        itemCount: cubit.chatUsers.length)
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          );
        });
  }

  Widget chatItem(UserModel chatUser, context) {
    return inkWell(context, chatUser);
  }

  InkWell inkWell(context, UserModel chatUser) {
    return InkWell(
    onTap: () {
      MasterCubit.get(context)
          .getMessagesFromUser(receiverID: chatUser.uId.toString());

      navigateTo(context, ChatDetailsWithUser(chatUser));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              chatUser.image.toString(),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            chatUser.name.toString(),
            style: const TextStyle(color: Colors.white, fontFamily: 'MyFont'),
          ),
        ],
      ),
    ),
  );
  }
}
