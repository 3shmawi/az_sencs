import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/icon_broken.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );

Widget defaultFormField(
  context, {
  required IconData icon,
  required TextEditingController controller,
  Widget? suffixIcon,
  required String hintText,
  required TextInputType textInputType,
  bool isPassword = false,
}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.width / 8,
    width: size.width / 1.22,
    alignment: Alignment.center,
    padding: EdgeInsets.only(right: size.width / 30),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(.05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.black.withOpacity(.8)),
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black.withOpacity(.7),
        ),
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
      ),
    ),
  );
}

Widget defaultTextButton(
  context, {
  required String text,
  required VoidCallback voidCallback,
  double width = double.infinity,
}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: voidCallback,
    child: Container(
      height: size.width / 8,
      width: size.width / width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        // color: const Color(0xff4796ff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text.toUpperCase(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget defaultOutLineButton({
  required String text,
  required VoidCallback voidCallback,
  double width = double.infinity,
}) {
  return SizedBox(
    width: width,
    child: OutlinedButton(
      onPressed: voidCallback,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'MyFont',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class MyBackgroundColor extends StatelessWidget {
  const MyBackgroundColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor('#01579b'),
            HexColor('#01579b'),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}

PreferredSize appBar(context, route, String title,
    [bool action = false, bool leading = true]) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, kToolbarHeight),
    child: ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: AppBar(
        // brightness: Brightness.light,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor:  HexColor('#002f6c'),
          //systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.black,
        ),
        backgroundColor: Colors.white.withOpacity(.5),
        elevation: 0,
        leading: leading
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  IconBroken.arrowLeft_2,
                ),
              )
            : Container(),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, fontFamily: 'MyFont'),
        ),
        centerTitle: true,
        actions: [
          action
              ? IconButton(
                  tooltip: 'profile',
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(IconBroken.profile,
                      color: Colors.black.withOpacity(.7)),
                  onPressed: () {
                    navigateTo(context, route);
                  },
                )
              : const SizedBox(),
          const Text('  '),
        ],
      ),
    ),
  );
}

class RouteWhereYouGo extends StatelessWidget {
  const RouteWhereYouGo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: const Text(
          'EXAMPLE  PAGE',
        ),
      ),
    );
  }
}



