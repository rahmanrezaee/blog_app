import 'package:bloc_app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class CompleteFileItem extends StatelessWidget {
  final void Function() onRemove;
  final String name;
  final String url;
  const CompleteFileItem({
    Key? key,
    required this.name,
    required this.url,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: AppColors.borderGreyColor,
        width: 0.5,
      ))),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CachedNetworkImage(
                imageUrl: url,
                height: 50,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
                ),
                errorWidget: (context, url, error) =>const Icon(Icons.error),
                width: 50,
                fit: BoxFit.cover,
              ),
              Text(
                extension(name),
                style:const TextStyle(
                  fontSize: 7.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
         const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon:const Icon(
              Icons.delete,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
