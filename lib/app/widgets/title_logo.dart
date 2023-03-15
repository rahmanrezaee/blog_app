import 'package:flutter/material.dart';

class TitleLogo extends StatelessWidget {
  const TitleLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text(
              "B",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          const  Text(
              "l",
              style: TextStyle(
                fontSize: 40,
                color: Colors.lime,
                fontWeight: FontWeight.w500,
              ),
            ),
           const Text(
              "o",
              style: TextStyle(
                fontSize: 40,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
           const Text(
              "g",
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "-",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              " A",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "p",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "p",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
