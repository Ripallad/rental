import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/main%20screens/forgotpin.dart';
import 'package:rental/main%20screens/login.dart';

class resetpsd extends StatelessWidget {
  const resetpsd({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 27, 62, 65),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.to(forgotpin()),
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
                      "Reset password",
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
                      Text("Reset password",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Your new password must be different from previously used password",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.5099999904632568),
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 244, 244, 244),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 244, 244, 244),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 244, 244, 244),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              label: Text("New Password")),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.5099999904632568),
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 244, 244, 244),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 244, 244, 244),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 244, 244, 244),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              label: Text("Confirm Password")),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () => Get.to(login()),
                        child: Container(
                          width: 390,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38),
                              color: Color(0xff1b3e41)),
                          child: Center(
                            child: Text(
                              "Save",
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
