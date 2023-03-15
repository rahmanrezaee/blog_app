import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconButton? button;
  const CustomAppBar({this.button, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: button == null
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          const BackButton(),
          SizedBox(
            width: button == null ? 60 : 0,
          ),
          button == null
              ? Text(
                  title,
                  style:const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : button!,
        ],
      ),
    );
  }
}
