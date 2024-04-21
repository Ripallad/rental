import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/main_screens/login.dart';
import 'package:rental/main_screens/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_screens/home.dart';
import '../main_screens/phoneverification.dart';

class authcontroller extends GetxController {
  FirebaseAuth a = FirebaseAuth.instance;
  RxString verId = ''.obs;
  verifyMobileNumber(contrycode, mobileno, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${contrycode + mobileno}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("invalid phone number")));
        } else {
          print(e);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verId.value = verificationId;
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    Get.to(() => phoneverification());
  }

  verifyOTP(code) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verId.value, smsCode: code);

      await auth.signInWithCredential(credential);

      Get.to(() => home());
    } catch (e) {
      Get.snackbar(
        "Error",
        'Enter Valid OTP.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  verifyotp(code) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verId.value, smsCode: code);
      await auth.signInWithCredential(credential);
      sp.setBool('phoneLogin', true);
      Get.offAll(() => navigation());
    } catch (e) {
      Get.snackbar("Error", "Invalid OTP");
    }
  }

  googlesignin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      GoogleAuthProvider gp = GoogleAuthProvider();

      final authdata = await a.signInWithProvider(gp);
      sp.setBool('googleLogin', true);
      Get.offAll(navigation());
    } catch (e) {
      log(e.toString());
      print(e.toString());
    }
  }

  logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.containsKey('googleLogin')) {
      a.signOut();
    }
    sp.clear();
    Get.offAll(() => login());
  }
}
