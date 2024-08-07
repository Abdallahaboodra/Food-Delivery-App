import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/view/login/customer_login_view.dart';
import 'package:password_strength/password_strength.dart';

import '../../common/globs.dart';
import '../../common/service_call.dart';
import '../../common_widget/round_textfield.dart';
import '../../helper/show_snak_bar.dart';
import '../home/delivery_man_home_view.dart';
import '../home/delivery_man_order_view.dart';
import '../on_boarding/on_boarding_view.dart';
import 'package:loading_overlay/loading_overlay.dart';

class DeliveryManSignUpView extends StatefulWidget {
  const DeliveryManSignUpView({super.key});

  @override
  State<DeliveryManSignUpView> createState() => _DeliveryManSignUpView();
}

class _DeliveryManSignUpView extends State<DeliveryManSignUpView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  GlobalKey<FormState> formlKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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
                    "Sign Up".tr(),
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Add your details to sign up".tr(),
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    onSubmit: (p0) {
                      txtEmail.text = p0;
                    },
                    hintText: "Email".tr(),
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    onSubmit: (p0) {
                      txtPassword.text = p0;
                    },
                    hintText: "Password".tr(),
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundTextfield(
                    hintText: "Confirm Password".tr(),
                    controller: txtConfirmPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundButton(
                      title: "Sign Up".tr(),
                      onPressed: () async {
                        btnSignUp();
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerLoginView(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an Account? ".tr(),
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Login".tr(),
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

  Future<void> registerUser() async {
    // Check if passwords match
    if (txtPassword.text != txtConfirmPassword.text) {
      mdShowAlert(Globs.appName, MSG.enterPasswordNotMatch, () {});
      return;
    }

    // Activate loading overlay
    setState(() {
      isLoading = true;
    });

    try {
      // Create user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text,
      );

      // You can add additional user details to Firebase here if needed

      // Navigate to the next page after successful registration
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DeliveryManHomeView(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        mdShowAlert(Globs.exitedEmail, MSG.exsistEmail, () {});
      } else {
        mdShowAlert('Error', e.message!, () {}); // Show error message
      }
    } finally {
      // Deactivate loading overlay
      setState(() {
        isLoading = false;
      });
    }
  }

  //TODO: Action
  void btnSignUp() {
    if (!txtEmail.text.isEmail) {
      mdShowAlert(Globs.appName, MSG.enterEmail, () {});
      return;
    }

    if (txtPassword.text.length < 6) {
      mdShowAlert(Globs.appName, MSG.enterPassword, () {});
      return;
    }

    if (txtPassword.text != txtConfirmPassword.text) {
      mdShowAlert(Globs.appName, MSG.enterPasswordNotMatch, () {});
      return;
    }

    // Check password strength
    double strength = estimatePasswordStrength(txtPassword.text);

    // You can set your desired password strength threshold here
    if (strength < 0.3) {
      mdShowAlert(
        Globs.appName.tr(),
        "Password should be stronger.",
        () {},
      );
      return;
    }

    // If password is strong, proceed with registration
    registerUser();

    //TODO: ServiceCall

    void serviceCallSignUp() async {}
  }
}
