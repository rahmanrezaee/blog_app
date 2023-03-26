import 'package:bloc_app/app/routes/app_pages.dart';
import 'package:bloc_app/app/stores/blog_store.dart';
import 'package:bloc_app/app/util/const.dart';
import 'package:bloc_app/app/util/reponsive.dart';
import 'package:bloc_app/app/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class BlogListItems extends StatelessWidget {
  const BlogListItems(this.store, {super.key});

  final BlogStore store;

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        if (store.items.isEmpty &&
            // ignore: unrelated_type_equality_checks
            store.fetchBlogFuture == FutureStatus.fulfilled) {
          return Container(
            height: getHeightWithoutAppbarSize(context),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('We could not find any Post '),
                    Text(
                      store.user,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        if (store.fetchBlogFuture.status == FutureStatus.pending) {
          return Container(
            height: getHeightWithoutAppbarSize(context),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: store.items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) {
              final repo = store.items[index];
              return PostItem(
               
                model: repo,
                // edit: () {
                //   Navigator.pushNamed(context, Routes.BLOG_FORM,
                //       arguments: repo);
                // },
                // delete: () async {
                //   await store.deleteBlog(repo.id);
                //   showAlert("Successfully Deleted");
                // },
              );
            });
      });
}
