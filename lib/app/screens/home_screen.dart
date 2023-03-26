import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/app_pages.dart';
import '../stores/blog_store.dart';
import '../widgets/home/blog_list_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlogStore _store = Provider.of<BlogStore>(context, listen: false);

    _store.fetchBlog();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List"),
        actions: [
          InkWell(
            onTap: (){

            },
            child:const Icon(Icons.person),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _store.fetchBlog();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlogListItems(_store),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, Routes.BLOG_FORM);
          },
          label: Row(
            children: const [
              Icon(
                Icons.post_add,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Create Blog",
                style: TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          )),
    );
  }
}
