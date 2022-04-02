import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/message_model.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/cubit/cubit/master_cubit.dart';
import '../../../shared/cubit/states/master_states.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icon_broken.dart';

class ChatDetailsWithAdmin extends StatelessWidget {
  var sendMessageController = TextEditingController();
  var listController = ScrollController();

  ChatDetailsWithAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MasterCubit, MasterStates>(
      listener: (BuildContext context, Object? state) {
        if (state is SendMessageSuccessState) {
          sendMessageController.clear();
          MasterCubit.get(context).getNotifications();
          Timer(
              const Duration(seconds: 1),
              () => listController
                  .jumpTo(listController.position.maxScrollExtent));
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = MasterCubit.get(context);
        if (cubit.messagesWithAdmin.isNotEmpty) {
          Timer(
              const Duration(seconds: 1),
              () => listController
                  .jumpTo(listController.position.maxScrollExtent));
        }

        return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  IconBroken.arrowLeft_2,
                  color: Colors.black,
                ),
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/azsencs-5dbc4.appspot.com/o/icon.png?alt=media&token=65ad78fc-aa65-4ca2-9261-be475f8b4e46',
                    ),

                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Az_SENCS',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 17,
                        ),
                  ),
                ],
              ),
            ),
            bottomSheet: BottomSheet(
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.only(bottom: 5.0,left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Expanded(
                      child: Container(
                        height: 40.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.grey[300],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            maxLines: null,
                            minLines: 1,
                            autofocus: true,
                            controller: sendMessageController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'Send a Message...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (sendMessageController.text.isNotEmpty) {
                          cubit.sendMessageToAdmin(
                            text: sendMessageController.text,
                          );
                        }
                      },
                      icon: const Icon(
                        IconBroken.send,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              onClosing: () {},
            ),
            body: state is GetMessageLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : cubit.messagesWithAdmin.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: 100,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  controller: listController,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    if (cubit.messagesWithAdmin[index].senderId ==
                                        cubit.user!.uId) {
                                      return sendMessage(
                                          cubit.messagesWithAdmin[index], context);
                                    } else {
                                      return receiveMessage(
                                          cubit.messagesWithAdmin[index], context);
                                    }
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 15,
                                      ),
                                  itemCount: cubit.messagesWithAdmin.length),
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text('Start your first chat'),
                      ));
      },
    );
  }

  Widget sendMessage(MessageModel model, context) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: defaultColor.withOpacity(
              .2,
            ),
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(
                10.0,
              ),
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                model.text.toString(),
              ),
              Text(
                daysBetween(DateTime.parse(model.dateTime.toString())),
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 8),
              ),
            ],
          ),
        ),
      );

  Widget receiveMessage(MessageModel model, context) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(
                10.0,
              ),
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.text.toString(),
              ),
              Text(
                daysBetween(DateTime.parse(model.dateTime.toString())),
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 8),
              ),
            ],
          ),
        ),
      );
}
