import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/authcontroller.dart';
import 'package:rental/main_screens/forgot.dart';
import 'package:rental/main_screens/signup.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller controller = Get.put(authcontroller());
    var mobilecontroller = TextEditingController();
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
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
                        "Sign in",
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
                        Text("welcome back",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Enter your credential login",
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
                          color: Color(0x30CCCCCC),
                          child: TabBar(
                            indicator: BoxDecoration(color: Colors.red),
                            indicatorColor: Colors.red,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Container(child: Text("USER")),
                              Text("PARTNER"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: 390,
                          child: TextFormField(
                            controller: mobilecontroller,
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Colors.black.withOpacity(0.5099999904632568),
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
                                label: Text("Phone number")),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            if (mobilecontroller.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("please enter mobile numner")));
                            } else {
                              controller.verifyMobileNumber(
                                  '+91', mobilecontroller.text, context);
                            }
                          },
                          child: Container(
                            width: 390,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(38),
                                color: Color(0xff1b3e41)),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () => Get.to(forgot()),
                            child: Text("forgot your password",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 223, 70, 62))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "or",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 223, 70, 62)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                
                                final auth = await controller.googlesignin();

                                print(auth);
                              },
                              child: Container(
                                width: 70,
                                height: 45,
                                // color: Colors.amber,
                                child: Image.asset("assets/images/g1.png"),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 45,
                              // color: Colors.amber,
                              child: Image.asset("assets/images/f1.png"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account ?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 166, 168, 170)),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () => Get.to(signup()),
                              child: Text(
                                "Sign-Up",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 223, 70, 62)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
