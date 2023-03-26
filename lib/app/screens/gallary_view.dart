import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../util/const.dart';
import '../widgets/loading_widget.dart';
import '../widgets/video_chat_player.dart';

class GalleryViewPage extends StatefulWidget {
  final int initalIndex;
  final List<Map> items;
  const GalleryViewPage({Key? key, required this.items, this.initalIndex = 0})
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

  Widget generateGallary(Map item) {
   
    if (item['type'] == FileTypeUpload.video.name) {
      return VideoChatPlayerWidget(url: item['url']);
    } else {
      return CachedNetworkImage(
        imageUrl: item['url'],
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const LoadingWidget(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      );
    }
  }
}
