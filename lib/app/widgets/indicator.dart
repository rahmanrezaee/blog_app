import 'package:flutter/material.dart';

class Indicator {
  static void showLoading() {
   const Dialog(

      child:
      Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void closeLoading() {
   
  }
}
