import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'phoneverification.dart';

class authcontroller extends GetxController {
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
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verId.value, smsCode: code);
      await auth.signInWithCredential(credential);
      Get.to(() => home());
    } catch (e) {
      Get.snackbar("Error", "Invalid OTP");
    }
  }
}
