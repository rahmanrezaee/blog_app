import 'package:bloc_app/app/util/typegraph.dart';
import 'package:bloc_app/theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'upload_file/complete_file_item.dart';
import 'upload_file/uploading_file_item.dart';

class UploadFileComponent extends StatelessWidget {
  List<Map> tempFiles;
  final void Function() onFileSelected;
  final void Function(int) onFileRemove;
  final void Function(int) onFileCancel;

  UploadFileComponent({
    Key? key,
    required this.onFileSelected,
    required this.onFileRemove,
    required this.onFileCancel,
    this.tempFiles = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(3),
          padding: EdgeInsets.zero,
          color: AppColors.brandColor,
          strokeWidth: 1.07,
          strokeCap: StrokeCap.round,
          dashPattern: [8, 4],
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.listBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            child: InkWell(
              onTap: onFileSelected,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: AppColors.brandColor,
                        ),
                        Text(
                          "Upload Images",
                          style: headline6.copyWith(
                              color: AppColors.brandColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tempFiles.length,
          itemBuilder: ((context, index) {
            return tempFiles[index]['status'] == "uploading"
                ? UploadingFileItem(
                    onCancel: () {
                      onFileCancel(index);
                    },
                    name: tempFiles[index]['name'],
                    percentage: tempFiles[index]['percentage'].toInt(),
                  )
                : CompleteFileItem(
                    onRemove: () {
                      onFileRemove(index);
                    },
                    name: tempFiles[index]['name'] ?? "Image.jpg",
                    url: tempFiles[index]['url'],
                  );
          }),
        )
      ],
    );
  }
}
