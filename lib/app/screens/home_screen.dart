import 'package:bloc_app/app/routes/app_pages.dart';
import 'package:bloc_app/app/stores/blog_store.dart';
import 'package:bloc_app/app/widgets/home/blog_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlogStore _store = Provider.of<BlogStore>(context, listen: false);

    _store.fetchBlog();

    return Scaffold(
      appBar: AppBar(
        title: Text("Post List"),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: BlogListItems(_store),
              ),
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
