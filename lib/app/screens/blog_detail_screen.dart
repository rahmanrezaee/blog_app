import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../theme/colors.dart';
import '../models/blog_model.dart';
import '../stores/reaction_store.dart';
import '../util/const.dart';
import '../util/extention.dart';
import '../widgets/MediaPlayerWidget.dart';
import '../widgets/like_animation.dart';
import 'profile_screen.dart';

class BlogDetailScreen extends StatelessWidget {
  BlogDetailScreen({super.key});

  final ReactionStore _reactionStore = ReactionStore();
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // controller.checkIfAlreadyFavourite(model.id);
    final model = ModalRoute.of(context)!.settings.arguments as BlogsModel;

    _reactionStore.getLike(model.id);
    _reactionStore.getCommentsPost(model.id);
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),
        bottomSheet: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_reactionStore.isLoading) const LinearProgressIndicator(),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration.collapsed(
                            hintText: 'Write a comment...'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final content = _commentController.text.trim();
                        if (content.isNotEmpty) {
                          _reactionStore.addComment(model.id, content);
                          // context
                          //     .read<CommentsBloc>()
                          //     .add(CommentsPostComment(content: content));
                          _commentController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(9.0),
          child: SingleChildScrollView(
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
                          userId: model.userId,
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
                                  model.userId,
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
                  model: model,
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
                        onPressed: () =>
                            _reactionStore.likePost(model.id.toString()),
                      ),
                    ),
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
                                  model.time.toFormatDate(),
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
                          model.description,
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
                ),
                Visibility(
                  visible: _reactionStore.commentList.isNotEmpty,
                  replacement: const Text("No Comment"),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    itemCount: _reactionStore.commentList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final comment = _reactionStore.commentList[index];
                      return ListTile(
                        leading: const CircleAvatar(
                          radius: 16,
                          backgroundImage: CachedNetworkImageProvider(
                            userPlaceholderUrl,
                          ),
                        ),
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: comment.author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(text: ' '),
                              TextSpan(text: comment.content),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          comment.date.toFormatDate(),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
