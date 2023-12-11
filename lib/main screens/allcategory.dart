import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental/widgets/commonwidget.dart';

class allcategory extends StatelessWidget {
  const allcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text("Allcategory",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1b3e41),
                )),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 600,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return homeCategory(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
