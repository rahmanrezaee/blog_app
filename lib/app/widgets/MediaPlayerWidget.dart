
import 'package:flutter/material.dart';

import '../models/blog_model.dart';
import '../screens/gallary_view.dart';

class MediaPlayer extends StatelessWidget {
  const MediaPlayer({
    super.key,
    required this.model,
    required this.isPopUpMenuEnabled,
  });

  final BlogsModel model;
  final bool isPopUpMenuEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: GalleryViewPage(
        items: model.images,
        initalIndex: 0,
      ),
    );
  }
}