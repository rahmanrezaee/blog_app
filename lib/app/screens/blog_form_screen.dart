import 'dart:developer';
import 'dart:io';

import 'package:bloc_app/app/services/firebase_functions.dart';
import 'package:bloc_app/app/stores/blog_store.dart';
import 'package:bloc_app/app/util/typegraph.dart';
import 'package:bloc_app/app/widgets/loading_widget.dart';
import 'package:bloc_app/app/models/blog_model.dart';
import 'package:bloc_app/theme/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

import '../widgets/uploading_component.dart';

// ignore: must_be_immutable
class BlogFormScreen extends StatefulWidget {
  @override
  State<BlogFormScreen> createState() => _BlogFormScreenState();
}

class _BlogFormScreenState extends State<BlogFormScreen> {
  BlogsModel? model;

  var title = TextEditingController(), description = TextEditingController();
  List<Map> images = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model = ModalRoute.of(context)!.settings.arguments as BlogsModel;
      title.text = model!.title;
      description.text = model!.description;
      if (model!.images != null && model!.images!.isNotEmpty) {
        images = model!.images!.map((e) => {"url": e}).toList();
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model == null ? "Create Blog" : "Update Blog",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                UploadFileComponent(
                  tempFiles: images,
                  onFileCancel: (index) {
                    setState(() {
                      // _requestModel.document[index]['cancelToken']?.cancel();
                      images.removeAt(index);
                      // tempFiles
                    });
                  },
                  onFileRemove: (index) {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                  onFileSelected: pickFile,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Title",
                  overflow: TextOverflow.ellipsis,
                  style: headline6.copyWith(
                      fontSize: 14, color: AppColors.grayTitleText),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: title,
                  onSaved: (value) {
                    title.text = value.toString();
                  },
                  validator: ValidationBuilder().required().build(),
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  overflow: TextOverflow.ellipsis,
                  style: headline6.copyWith(
                      fontSize: 14, color: AppColors.grayTitleText),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: description,
                  onSaved: (value) {
                    description.text = value.toString();
                  },
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : onSaveData,
                    child: _isLoading
                        ? LoadingWidget()
                        : Text(
                            model == null ? "Create Blog" : "Update Blog",
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FirebaseFunctions _service = FirebaseFunctions();
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowCompression: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mp4'],
    );

    if (result == null) return;
    result.files.forEach((element) {
      images = [
        ...images,
        {
          "name": element.name,
          "path": element.path,
          "percentage": 0,
          "status": "uploading",
          "url": "",
        }
      ];
    });

    images.asMap().forEach((index, element) async {
      await _service.uploadImage(File(element["path"]), onFinish: (url) {
        setState(() {
          images[index]["status"] = "complete";
          images[index]["url"] = url;
        });
      }, onSendProgress: (mount, total) {
        print("percentage $mount $total");
        setState(() {
          images[index]["percentage"] = (mount / total) * 100;
        });
      });
    });
  }

  bool _isLoading = false;
  Future onSaveData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      var store = Provider.of<BlogStore>(context, listen: false);

      List<String> image = images.map((e) => e['url'].toString()).toList();

      try {
        if (model != null) {
          await store.editBlog(BlogsModel(
              description: description.text.toString(),
              title: title.text.toString(),
              images: image,
              id: model!.id));
        } else {
          await store.addBlog(BlogsModel(
              description: description.text.toString(),
              title: title.text.toString(),
              images: image,
              id: ''));
        }

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        print("show all error $e");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
