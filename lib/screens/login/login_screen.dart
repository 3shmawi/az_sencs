import 'package:az_sencs/screens/login/cubit/cubit.dart';
import 'package:az_sencs/screens/login/cubit/states.dart';
import 'package:az_sencs/shared/components/components.dart';
import 'package:az_sencs/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/network/local/cache_helper.dart';
import '../home/home_screen.dart';

import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId);
            Fluttertoast.showToast(
              msg: 'login success',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            ).then((value) {
              navigateAndFinish(context, const HomeScreen());
            });
          } else if (state is LoginErrorState) {
            for (int i = 0; i < state.error.length; i++) {
              if (state.error[i] == ']') {
                Fluttertoast.showToast(
                  msg: state.error.substring(i + 1, state.error.length),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                break;
              }
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                const MyBackgroundColor(),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.width * 1.1,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'MyFont',
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                        const SizedBox(),
                        defaultFormField(
                          context,
                          controller: emailController,
                          icon: IconBroken.document,
                          hintText: 'Email...',
                          textInputType: TextInputType.emailAddress,
                        ),
                        defaultFormField(
                          context,
                          controller: passwordController,
                          icon: IconBroken.lock,
                          hintText: 'Password...',
                          textInputType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            icon: Icon(
                              cubit.suffix,
                            ),
                          ),
                          isPassword: cubit.isPassword,
                        ),
                        state is! LoginLoadingState
                            ? Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 40,
                                  child: defaultOutLineButton(
                                    text: 'login',
                                    voidCallback: () {
                                      cubit.userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    },
                                  ),
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account? '),
                            RichText(
                              text: TextSpan(
                                text: 'Create one now',
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    navigateTo(context, const RegisterScreen());
                                  },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
