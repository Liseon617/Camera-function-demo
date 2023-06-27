import 'package:sign_in_button/sign_in_button.dart';
import 'package:demo_app_v4/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? mainButtonTitle;
  final Widget? form;
  final bool showTermsText;
  final void Function()? onMainButtonTapped;
  final void Function()? onCreateAccountTapped;
  final void Function()? onForgotPassword;
  final void Function()? onBackPressed;
  final void Function()? onSignInWithApple;
  final void Function()? onSignInWithGoogle;
  final String? validationMessage;
  final bool busy;

  const AuthenticationLayout(
      {Key? key,
      this.title,
      this.subtitle,
      this.mainButtonTitle,
      this.form,
      this.showTermsText = false,
      this.onMainButtonTapped,
      this.onCreateAccountTapped,
      this.onForgotPassword,
      this.onBackPressed,
      this.validationMessage,
      this.onSignInWithApple,
      this.onSignInWithGoogle,
      this.busy = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: onBackPressed,
            ),
          Text(
            title!,
            style: const TextStyle(fontSize: 34),
          ),
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                width: screenWidthPercentage(context, percentage: 0.7),
                child: Text(
                  subtitle!,
                  style: ktsMediumGreyBodyText,
                )),
          ),
          verticalSpaceRegular,
          form!,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onForgotPassword,
                child: Text('Forget Password?',
                    style: ktsMediumGreyBodyText.copyWith(
                        fontWeight: FontWeight.bold)),
              ),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: kBodyTextSize,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          GestureDetector(
              onTap: onMainButtonTapped ,
              child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: busy ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : Text(
                          mainButtonTitle!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ))),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            GestureDetector(
                onTap: onCreateAccountTapped,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    horizontalSpaceTiny,
                    Text('Create an account',
                        style: TextStyle(
                          color: kcPrimaryColor,
                        ))
                  ],
                )),
          if (showTermsText)
            const Text(
              'By Signing up you agree to our terms, conditions and privacy policy.',
              style: ktsMediumGreyBodyText,
              textAlign: TextAlign.center,
            ),
          verticalSpaceRegular,
          const Align(
              alignment: Alignment.center,
              child: Text(
                'or',
                style: ktsMediumGreyBodyText,
              )),
          if (Platform.isIOS) verticalSpaceRegular,
          if (Platform.isIOS)
            SignInButtonBuilder(
                icon: Icons.apple,
                iconColor: Colors.white,
                backgroundColor: Colors.black,
                fontSize: 14,
                textColor: Colors.white,
                height: 50,
                onPressed: onSignInWithApple ?? () {},
                text: 'CONTINUE WITH APPLE'),
          // AppleAuthButton(
          //     onPressed: onSignInWithApple ?? () {},
          //     text: 'CONTINUE WITH APPLE',
          //     style: const AuthButtonStyle(
          //       iconSize: 24,
          //       height: 50,
          //       textStyle: TextStyle(color: Colors.white, fontSize: 14),
          //       buttonType: AuthButtonType.secondary,
          //     )
          // ),
          if (Platform.isAndroid) verticalSpaceRegular,
          if (Platform.isAndroid)
            SignInButton(
              Buttons.google,
              onPressed: onSignInWithGoogle ?? () {},
              text: 'CONTINUE WITH GOOGLE',
            ),
            // SignInButtonBuilder(
            //     icon: Icons.apple,
            //     iconColor: Colors.white,
            //     backgroundColor: Colors.black,
            //     fontSize: 14,
            //     textColor: Colors.white,
            //     height: 50,
            //     onPressed: onSignInWithGoogle ?? () {},
            //     text: 'CONTINUE WITH GOOGLE'),
          // GoogleAuthButton(
          //   onPressed: onSignInWithGoogle ?? () {},
          //   text: 'CONTINUE WITH GOOGLE',
          //   style: const AuthButtonStyle(
          //     buttonColor: Color(0xff4285f4),
          //     iconBackground: Colors.white,
          //     iconSize: 24,
          //     height: 50,
          //     textStyle: TextStyle(color: Colors.white, fontSize: 14),
          //     buttonType: AuthButtonType.secondary,
          //   ),
          // ),
        ],
      ),
    );
  }
}
