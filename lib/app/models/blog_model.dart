import 'package:intl/intl.dart';

class BlogsModel {
  late String id, title, description;
  List<String>? images;
  String? time;

  BlogsModel(
      {required this.description,
      required this.title,
      required this.id,
      this.time,
      this.images});

  BlogsModel.fromJson(Map<String, dynamic> map) {
    if (map['images'] != null) {
      images = [];

      (map["images"]).forEach((element) {
        images!.add(element);
      });
    }

    final df = DateFormat('dd MMM');

    id = map['id'];
    title = map['title'];
    time = df.format(map['time'].toDate());
    description = map['description'];
  }
}
