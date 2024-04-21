import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/authcontroller.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(authcontroller());
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            width: 420,
            height: 810,
            decoration: BoxDecoration(
              color: Color(0xFF1B3E41),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 105,
                    ),
                    Container(
                      width: 420,
                      height: 640,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Container(
                              width: 315,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color(0x30CCCCCC),
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0x30CCCCCC),
                                  ),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xFFDF453E),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      color: Color(0xFF787474),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF787474),
                                    size: 17,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 315,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color(0x30CCCCCC),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0x30CCCCCC),
                                ),
                                borderRadius: BorderRadius.circular(13)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.lock_open,
                                    color: Color(0xFFDF453E),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Change Password",
                                  style: TextStyle(
                                    color: Color(0xFF787474),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF787474),
                                  size: 17,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 315,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color(0x30CCCCCC),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0x30CCCCCC),
                                ),
                                borderRadius: BorderRadius.circular(13)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.history,
                                    color: Color(0xFFDF453E),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Order History",
                                  style: TextStyle(
                                    color: Color(0xFF787474),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF787474),
                                  size: 17,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              auth.logout();
                            },
                            child: Container(
                              width: 315,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color(0x30CCCCCC),
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0x30CCCCCC),
                                  ),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.logout,
                                      color: Color(0xFFDF453E),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      color: Color(0xFF787474),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF787474),
                                    size: 17,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      // borderRadius: BorderRadius.circular(40)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 140,
            child: Column(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/prof1.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  "Patel Sandhya",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
