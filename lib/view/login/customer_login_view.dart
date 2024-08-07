import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/extension.dart';
import 'package:food_delivery/common/globs.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/view/login/rest_password_view.dart';
import 'package:food_delivery/view/login/customer_sing_up_view.dart';
import 'package:food_delivery/view/on_boarding/on_boarding_view.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../common/service_call.dart';
import '../../common_widget/round_icon_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../helper/show_snak_bar.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class CustomerLoginView extends StatefulWidget {
  const CustomerLoginView({super.key});

  @override
  State<CustomerLoginView> createState() => _CustomerLoginViewState();
}

class _CustomerLoginViewState extends State<CustomerLoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> formlKey = GlobalKey();
  bool isLoading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        body: Form(
          key: formlKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    "Customer Login".tr(),
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Add your details to login".tr(),
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    onSubmit: (data) {
                      txtEmail.text = data;
                    },
                    hintText: "Your Email".tr(),
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    onSubmit: (data) {
                      txtPassword.text = data;
                    },
                    hintText: "Password".tr(),
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundButton(
                      title: "Login".tr(),
                      onPressed: () async {
                        btnLogin();
                      }),
                  const SizedBox(
                    height: 4,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordView(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot your password?".tr(),
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "or Login With".tr(),
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundIconButton(
                    icon: "assets/img/google_logo.png",
                    title: "Login with Google".tr(),
                    color: const Color(0xffDD4B39),
                    onPressed: () async {
                      await signInWithGoogle();
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerSignUpView(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have an Account? ".tr(),
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Sign Up".tr(),
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading = true;
      setState(() {});
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        // Navigate to the next page after successful sign-in
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingView(),
            ));
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      // Handle error
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text,
      );

      // Navigate to the next page after successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });

      if (e.code == 'wrong-password') {
        mdShowAlert('خطأ', 'كلمة المرور غير صحيحة', () {});
      } else if (e.code == 'user-not-found') {
        mdShowAlert('خطأ', 'الحساب غير موجود', () {});
      } else {
        mdShowAlert('خطأ', 'المصادقة غير صحيحة أو غير صالحة', () {});
      }
    }
  }

  void btnLogin() {
    if (!txtEmail.text.isEmail) {
      mdShowAlert(Globs.appName, MSG.enterEmail, () {});
      return;
    }

    if (txtPassword.text.length < 6) {
      mdShowAlert(Globs.appName, MSG.enterPassword, () {});
      return;
    }

    loginUser();
  }

  //TODO: ServiceCall

  void serviceCallLogin(Map<String, dynamic> parameter) {}
}
