import 'package:az_sencs/screens/boarding/on_boarding.dart';
import 'package:az_sencs/screens/home/home_screen.dart';
import 'package:az_sencs/screens/login/login_screen.dart';
import 'package:az_sencs/screens/splash/splash_screen.dart';
import 'package:az_sencs/shared/bloc_observer/bloc_opserver.dart';
import 'package:az_sencs/shared/components/constants.dart';
import 'package:az_sencs/shared/cubit/cubit/master_cubit.dart';
import 'package:az_sencs/shared/cubit/states/master_states.dart';
import 'package:az_sencs/shared/network/local/cache_helper.dart';
import 'package:az_sencs/shared/network/remote/dio_helper.dart';

import 'package:az_sencs/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/notification_model.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //makeToast('On Background Messaging App : ${message.data.toString()}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await DioHelper.init();

  uId = CacheHelper.getData(key: 'uId');
  var token = await FirebaseMessaging.instance.getToken();

  debugPrint(token.toString());

  // handle firebase Messaging FCM ............
  FirebaseMessaging.onMessage.listen((event) {
    NotificationModel model = NotificationModel(
        senderName: event.data['senderUser'],
        senderImage: event.data['senderImage'],
        dateTime: event.data['dateTime']);
    notificationList.add(model);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    NotificationModel model = NotificationModel(
        senderName: event.data['senderUser'],
        senderImage: event.data['senderImage'],
        dateTime: event.data['dateTime']);
    notificationList.add(model);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Widget widget;

  //get data  from shared preference

  bool? onBoard = CacheHelper.getData(key: 'onBoarding');
// CacheHelper.removeData(key: 'uId');
// CacheHelper.removeData(key: 'onBoarding');

  if (onBoard != null) {
    if (uId == null) {
      widget = const LoginScreen();
    } else {
      widget = const HomeScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  //
  // if (uId != null) {
  //   widget = const HomeScreen();
  // } else {
  //   widget = const LoginScreen();
  // }
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  final Widget startWidget;

  MyApp({Key? key, required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MasterCubit()
        ..getUserData()
        ..getMessagesFromAdmin()
        ..getChatUsers()
        ..getNotifications(),
      child: BlocConsumer<MasterCubit, MasterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: FutureBuilder(
              future: _fbApp,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  debugPrint(
                    'You have an error! ${snapshot.error.toString()}',
                  );
                  return const Text(
                    'Something went wrong!',
                  );
                } else if (snapshot.hasData) {
                  return MyCustomSplashScreen(startWidget);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
