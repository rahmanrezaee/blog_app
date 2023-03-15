import 'package:bloc_app/app/models/blog_model.dart';
import 'package:bloc_app/app/routes/app_pages.dart';
import 'package:bloc_app/app/util/const.dart';
import 'package:bloc_app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final BlogsModel model;
  final bool isPopUpMenuEnabled;
  final Function? edit, delete;

  const PostItem(
      {required this.isPopUpMenuEnabled,
      required this.model,
      this.edit,
      this.delete,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.BLOG_DETAIL_SCREEN,
            arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image.
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      model.images != null && model.images!.isNotEmpty
                          ? model.images!.first
                          : postPlaceholderUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.topRight,
                child: isPopUpMenuEnabled
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: PopupMenuButton(
                          onSelected: (value) {
                            if (value == 0) {
                              edit!();
                            } else if (value == 1) {
                              delete!();
                            }
                          },
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text("Edit"),
                              value: 0,
                            ),
                            const PopupMenuItem(
                              child: Text("Delete"),
                              value: 1,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),

              const SizedBox(
                height: 5,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        model.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      model.time ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grayText2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  model.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
