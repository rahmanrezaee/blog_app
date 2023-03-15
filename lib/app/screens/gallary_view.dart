import 'package:bloc_app/app/util/const.dart';
import 'package:bloc_app/app/widgets/loading_widget.dart';
import 'package:bloc_app/app/widgets/video_chat_player.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GalleryViewPage extends StatefulWidget {
  final int initalIndex;
  final List<String> items;
  GalleryViewPage({Key? key, required this.items, this.initalIndex = 0})
      : super(key: key);

  @override
  State<GalleryViewPage> createState() => _GalleryViewPageState();
}

class _GalleryViewPageState extends State<GalleryViewPage> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.initalIndex;
    super.initState();
  }

  @override
  void dispose() {
    currentIndex = widget.initalIndex;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              children: <Widget>[
                ...widget.items
                    .map((e) => Center(
                          child: generateGallary(e),
                        ))
                    .toList()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget generateGallary(String item) {
    print("item $item");
    if (item.endsWith(".png") ||
        item.endsWith(".jpg") ||
        item.endsWith(".jpeg")) {
      return CachedNetworkImage(
        imageUrl: item,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const LoadingWidget(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      );
    } else if (item.endsWith(".mp4")) {
      return VideoChatPlayerWidget(url: item);
    } else {
      return CachedNetworkImage(
        imageUrl: item,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const LoadingWidget(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      );
    }
  }
}
