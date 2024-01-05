import 'package:flutter/material.dart';

button(text, page, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => page,
      ));
    },
    child: Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      width: 390,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        color: Color(0xff1b3e41),
      ),
    ),
  );
}
