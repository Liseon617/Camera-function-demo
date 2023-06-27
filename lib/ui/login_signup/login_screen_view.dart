import 'dart:io' show Platform;

import 'package:demo_app_v4/ui/login_signup/login_screen_view.form.dart';
import 'package:demo_app_v4/ui/login_signup/login_screen_viewmodel.dart';
import 'package:demo_app_v4/ui/shared/background.dart';
import 'package:demo_app_v4/ui/shared/fade_animation.dart';
import 'package:demo_app_v4/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@FormView(fields: [
  FormTextField(name: 'loginEmail'),
  FormTextField(name: 'loginPassword'),
  FormTextField(name: 'registerUsername'),
  FormTextField(name: 'registerEmail'),
  FormTextField(name: 'registerPassword'),
  FormTextField(name: 'loginRegisterPassword'),
  FormTextField(name: 'authType'),
])
class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  _LoginScreenView createState() => _LoginScreenView();
}

class _LoginScreenView extends State<LoginScreenView> with $LoginScreenView {
  int _pageState = 1;

  var _backgroundColor = Colors.white;
  var _headingColor = const Color.fromARGB(251, 64, 40, 74);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  //stack pagestate
  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 250;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = const Color.fromARGB(251, 64, 40, 74);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = const Color.fromARGB(251, 64, 40, 74);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = const Color.fromARGB(251, 64, 40, 74);
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 250;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 220;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 220;
        break;
    }

    return ViewModelBuilder<LoginScreenViewModel>.reactive(
        onViewModelReady: (model) => syncFormWithViewModel(model),
        builder: (context, model, child) => Scaffold(
              body: Stack(
                children: <Widget>[
                  const BackgroundWidget(),
                  const SizedBox(height: 20),
                  //Login
                  AnimatedContainer(
                    padding: const EdgeInsets.all(32),
                    width: _loginWidth,
                    height: _loginHeight,
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 1000),
                    transform: Matrix4.translationValues(
                        _loginXOffset, _loginYOffset, 1),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Log In to Begin",
                          style: TextStyle(fontSize: 20),
                        ),
                        Column(
                          children: [
                            FadeAnimation(
                                1.4,
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                32, 132, 232, .3),
                                            blurRadius: 20,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.email,
                                              ),
                                              labelText: "Email",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "Sofia"),
                                              border: InputBorder.none),
                                          controller: loginEmailController,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.vpn_key),
                                                labelText: "Password",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: "Sofia"),
                                                border: InputBorder.none),
                                            controller:
                                                loginPasswordController),
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('forget password working');
                              },
                              child: const FadeAnimation(
                                  1.5,
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Sofia"),
                                  )),
                            ),
                            model.validationMessage != null
                                ? SizedBox(
                                    height: 20,
                                    child: Text(
                                      model.validationMessage!,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: kBodyTextSize,
                                      ),
                                    ))
                                : const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                print("success");
                                authTypeController.text = "Login";
                                model.saveData();
                                if (model.validationMessage != null) {
                                  setState(() {
                                      isLoading = true;
                                  });
                                }
                              },
                              child: FadeAnimation(
                                1.6,
                                Container(
                                  width: 250,
                                  height: 50,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromRGBO(
                                          32, 122, 53, 70)),
                                  alignment: Alignment.center,
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        )
                                      : const Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const FadeAnimation(
                                1.7,
                                Text(
                                  "Continue with social media & OTP",
                                  style: TextStyle(
                                      color: Colors.grey, fontFamily: "Sofia"),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FadeAnimation(
                                    1.8,
                                    MaterialButton(
                                      onPressed: () {},
                                      color: const Color.fromARGB(
                                          255, 59, 89, 152),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(16),
                                      shape: const CircleBorder(),
                                      child: const Icon(
                                        FontAwesomeIcons.facebookF,
                                        size: 22,
                                      ),
                                    )),
                                // SizedBox(width: 10,),
                                FadeAnimation(
                                  1.9,
                                  Platform.isAndroid
                                      ? MaterialButton(
                                          onPressed: () {},
                                          color: const Color.fromARGB(
                                              255, 234, 67, 53),
                                          textColor: Colors.white,
                                          padding: const EdgeInsets.all(16),
                                          shape: const CircleBorder(),
                                          child: const Icon(
                                            FontAwesomeIcons.google,
                                            size: 22,
                                          ),
                                        )
                                      : MaterialButton(
                                          onPressed: () {},
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          textColor: Colors.black,
                                          padding: const EdgeInsets.all(16),
                                          shape: const CircleBorder(),
                                          child: const Icon(
                                            FontAwesomeIcons.apple,
                                            size: 22,
                                          ),
                                        ),
                                ),
                                FadeAnimation(
                                    1.9,
                                    MaterialButton(
                                      onPressed: () {},
                                      color: const Color.fromARGB(
                                          255, 52, 168, 83),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(16),
                                      shape: const CircleBorder(),
                                      child: const Icon(
                                        FontAwesomeIcons.mobileScreenButton,
                                        size: 22,
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                //clear field
                                loginEmailController.clear();
                                loginPasswordController.clear();
                                print('sign up working');
                                setState(() {
                                  _pageState = 2;
                                });
                              },
                              child: FadeAnimation(
                                  1.5,
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Don't have an Account? ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Sofia"),
                                        ),
                                        Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              color: Colors.blue.shade900,
                                              fontFamily: "Sofia",
                                              fontWeight: FontWeight.bold),
                                        )
                                      ])),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Registration
                  AnimatedContainer(
                    height: _registerHeight,
                    padding: const EdgeInsets.only(
                        left: 32, top: 27, right: 32, bottom: 20),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 1000),
                    transform:
                        Matrix4.translationValues(0, _registerYOffset, 1),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Create a New Account",
                          style: TextStyle(fontSize: 20),
                        ),
                        Column(
                          children: <Widget>[
                            FadeAnimation(
                                1.4,
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(32, 132, 232, .3),
                                          blurRadius: 25,
                                          offset: Offset(0, 10))
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsetsDirectional
                                                .symmetric(
                                            horizontal: 5, vertical: 0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.person,
                                              ),
                                              labelText: "Username",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "Sofia"),
                                              border: InputBorder.none),
                                          controller:
                                              registerUsernameController,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsetsDirectional
                                                .symmetric(
                                            horizontal: 5, vertical: 0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.email,
                                              ),
                                              labelText: "Email",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "Sofia"),
                                              border: InputBorder.none),
                                          controller: registerEmailController,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsetsDirectional
                                                .symmetric(
                                            horizontal: 5, vertical: 0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(Icons.vpn_key),
                                              labelText: "Password",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "Sofia"),
                                              border: InputBorder.none),
                                          controller:
                                              registerPasswordController,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsetsDirectional
                                                .symmetric(
                                            horizontal: 5, vertical: 0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200))),
                                        child: TextField(
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.vpn_key),
                                                labelText: "Confirm Password",
                                                labelStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: "Sofia"),
                                                border: InputBorder.none),
                                            controller:
                                                loginRegisterPasswordController),
                                      ),
                                    ],
                                  ),
                                )),
                            model.validationMessage != null
                                ? SizedBox(
                                    height: 20,
                                    child: Text(
                                      model.validationMessage!,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: kBodyTextSize,
                                      ),
                                    ))
                                : const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                print("success");
                                authTypeController.text = "Registration";
                                model.saveData();
                              },
                              child: FadeAnimation(
                                1.6,
                                Container(
                                  width: 250,
                                  height: 50,
                                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromRGBO(
                                          32, 122, 53, 70)),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const FadeAnimation(
                                1.7,
                                Text(
                                  "Continue with social media & OTP",
                                  style: TextStyle(
                                      color: Colors.grey, fontFamily: "Sofia"),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FadeAnimation(
                                    1.8,
                                    MaterialButton(
                                      onPressed: () {},
                                      color: const Color.fromARGB(
                                          255, 59, 89, 152),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(16),
                                      shape: const CircleBorder(),
                                      child: const Icon(
                                        FontAwesomeIcons.facebookF,
                                        size: 22,
                                      ),
                                    )),
                                // SizedBox(width: 10,),
                                FadeAnimation(
                                  1.9,
                                  Platform.isAndroid
                                      ? MaterialButton(
                                          onPressed: () {},
                                          color: const Color.fromARGB(
                                              255, 234, 67, 53),
                                          textColor: Colors.white,
                                          padding: const EdgeInsets.all(16),
                                          shape: const CircleBorder(),
                                          child: const Icon(
                                            FontAwesomeIcons.google,
                                            size: 22,
                                          ),
                                        )
                                      : MaterialButton(
                                          onPressed: () {},
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          textColor: Colors.black,
                                          padding: const EdgeInsets.all(16),
                                          shape: const CircleBorder(),
                                          child: const Icon(
                                            FontAwesomeIcons.apple,
                                            size: 22,
                                          ),
                                        ),
                                ),
                                FadeAnimation(
                                    1.9,
                                    MaterialButton(
                                      onPressed: () {},
                                      color: const Color.fromARGB(
                                          255, 52, 168, 83),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(16),
                                      shape: const CircleBorder(),
                                      child: const Icon(
                                        FontAwesomeIcons.mobileScreenButton,
                                        size: 22,
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                registerUsernameController.clear();
                                registerEmailController.clear();
                                registerPasswordController.clear();
                                loginRegisterPasswordController.clear();
                                print('Login is working');
                                setState(() {
                                  _pageState = 1;
                                });
                              },
                              child: FadeAnimation(
                                  1.5,
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Already Have an Account? ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Sofia"),
                                        ),
                                        Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.blue.shade900,
                                              fontFamily: "Sofia",
                                              fontWeight: FontWeight.bold),
                                        )
                                      ])),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => LoginScreenViewModel());
  }

  void _clearAll() {
    loginEmailController.clear();
    loginPasswordController.clear();
    registerUsernameController.clear();
    registerEmailController.clear();
    registerPasswordController.clear();
    loginRegisterPasswordController.clear();
    authTypeController.clear();
  }
}
