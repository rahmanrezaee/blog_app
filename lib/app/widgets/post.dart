import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../theme/colors.dart';
import '../models/blog_model.dart';
import '../routes/app_pages.dart';
import '../screens/profile_screen.dart';
import '../stores/reaction_store.dart';
import '../util/const.dart';
import '../util/extention.dart';
import 'MediaPlayerWidget.dart';
import 'like_animation.dart';

class PostItem extends StatefulWidget {
  final BlogsModel model;

  const PostItem({required this.model, Key? key}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final ReactionStore _reactionStore = ReactionStore();

  @override
  void initState() {
    super.initState();
    _reactionStore.getLike(widget.model.id);
    _reactionStore.getCommentsPost(widget.model.id);
  }

  @override
  Widget build(BuildContext context) {
   
    return Observer(builder: (context) {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.BLOG_DETAIL_SCREEN,
            arguments: widget.model),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              // boundary needed for web
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blackBorderColor),
              ),

              child: Column(
                children: [
                  // HEADER SECTION OF THE POST
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ).copyWith(right: 0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            userId: widget.model.userId,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 16,
                            backgroundImage: CachedNetworkImageProvider(
                              userPlaceholderUrl,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.model.userId,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // IMAGE SECTION OF THE POST
                  MediaPlayer(
                    model: widget.model,
                    isPopUpMenuEnabled: true,
                  ),
                  // LIKE, COMMENT SECTION OF THE POST
                  Row(
                    children: <Widget>[
                      LikeAnimation(
                        isAnimating: _reactionStore.isLiked,
                        smallLike: _reactionStore.isLiked,
                        child: IconButton(
                          icon: _reactionStore.isLiked
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                ),
                          onPressed: () => _reactionStore
                              .likePost(widget.model.id.toString()),
                        ),
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.comment_outlined,
                          ),
                          onPressed: () => Navigator.pushNamed(
                              context, Routes.BLOG_DETAIL_SCREEN,
                              arguments: widget.model)),
                      IconButton(
                          icon: const Icon(
                            Icons.send,
                          ),
                          onPressed: () {}),
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {}),
                      ))
                    ],
                  ),
                  //DESCRIPTION AND NUMBER OF COMMENTS
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w800),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${_reactionStore.likeList.length} likes',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    widget.model.time.toFormatDate(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: AppColors.greyTextColor,
                                            fontSize: 12),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Text(
                            widget.model.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pushNamed(context, Routes.BLOG_DETAIL_SCREEN,
  //           arguments: widget.model);
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.all(9.0),
  //       child: Material(
  //         elevation: 4,
  //         borderRadius: BorderRadius.circular(10),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(4.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     width: 35,
  //                     height: 35,
  //                     margin: const EdgeInsets.symmetric(horizontal: 8),
  //                     child: InkWell(
  //                       onTap: () {
  //                         Navigator.pushNamed(context, Routes.PROFILE);
  //                       },
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(60),
  //                         // radius: 30,

  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(60),
  //                               border: Border.all(
  //                                   color: Colors.grey[100]!, width: 1)),
  //                           child: CachedNetworkImage(
  //                             imageUrl: userPlaceholderUrl,
  //                             fit: BoxFit.cover,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: InkWell(
  //                       onTap: () {
  //                         Navigator.pushNamed(context, Routes.PROFILE);
  //                       },
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             "Unknows",
  //                             style: const TextStyle(
  //                                 fontSize: 13,
  //                                 fontWeight: FontWeight.bold,
  //                                 height: 0),
  //                           ),
  //                           Text(
  //                             widget.model.time.toFormatDate(),
  //                             overflow: TextOverflow.ellipsis,
  //                             maxLines: 2,
  //                             textAlign: TextAlign.start,
  //                             style: TextStyle(
  //                               fontSize: 12,
  //                               color: AppColors.grayText2,
  //                               fontWeight: FontWeight.w500,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   widget.isPopUpMenuEnabled
  //                       ? Padding(
  //                           padding: const EdgeInsets.all(10),
  //                           child: PopupMenuButton(
  //                             onSelected: (value) {
  //                               if (value == 0) {
  //                                 widget.edit!();
  //                               } else if (value == 1) {
  //                                 widget.delete!();
  //                               }
  //                             },
  //                             child: const Icon(
  //                               Icons.more_vert,
  //                               color: Colors.white,
  //                             ),
  //                             itemBuilder: (context) => [
  //                               const PopupMenuItem(
  //                                 child: Text("Edit"),
  //                                 value: 0,
  //                               ),
  //                               const PopupMenuItem(
  //                                 child: Text("Delete"),
  //                                 value: 1,
  //                               ),
  //                             ],
  //                           ),
  //                         )
  //                       : const SizedBox(),
  //                 ],
  //               ),
  //             ),
  //             //Image.
  //             MediaPlayer(
  //               model: widget.model,
  //               isPopUpMenuEnabled: widget.isPopUpMenuEnabled,
  //             ),

  //             const SizedBox(
  //               height: 5,
  //             ),

  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 12),
  //               child: Text(
  //                 widget.model.title,
  //                 overflow: TextOverflow.ellipsis,
  //                 maxLines: 2,
  //                 textAlign: TextAlign.start,
  //                 style: const TextStyle(
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 12),
  //               child: Text(
  //                 widget.model.description,
  //                 overflow: TextOverflow.ellipsis,
  //                 maxLines: 2,
  //                 textAlign: TextAlign.start,
  //                 style: const TextStyle(
  //                   fontSize: 13,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

