import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  final double padding;
  final double size;
  final double stroke;
  const LoadingWidget({
    this.padding = 0,
    this.color = Colors.white,
    this.size = 18,
    this.stroke = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(padding),
      child: CircularProgressIndicator(color: color, strokeWidth: stroke),
    );
  }
}