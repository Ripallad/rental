import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rental/main_screens/forgot.dart';
import 'package:rental/main_screens/resetpsd.dart';

class forgotpin extends StatelessWidget {
  const forgotpin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 27, 62, 65),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.to(forgot()),
              child: Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 223, 70, 62)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 27, 62, 65),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Phone verification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: 420,
                height: 680,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text("Phone verification",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Enter your OTP code here",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Pinput(
                        length: 6,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () => Get.to(resetpsd()),
                        child: Container(
                          width: 390,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38),
                              color: Color(0xff1b3e41)),
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
