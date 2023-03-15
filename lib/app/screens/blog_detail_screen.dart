import 'package:bloc_app/app/models/blog_model.dart';
import 'package:bloc_app/app/screens/gallary_view.dart';
import 'package:bloc_app/app/util/reponsive.dart';
import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // controller.checkIfAlreadyFavourite(model.id);
    final model = ModalRoute.of(context)!.settings.arguments as BlogsModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                height: 200,
                width: getWidth(context),
                child: GalleryViewPage(items: model.images ?? [])),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text(
                model.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text(
                model.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
