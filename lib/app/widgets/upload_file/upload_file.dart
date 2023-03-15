import 'package:bloc_app/app/util/typegraph.dart';
import 'package:bloc_app/app/widgets/upload_file/complete_file_item.dart';
import 'package:bloc_app/app/widgets/upload_file/uploading_file_item.dart';
import 'package:bloc_app/theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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
          radius:const Radius.circular(3),
          padding: EdgeInsets.zero,
          color: AppColors.brandColor,
          strokeWidth: 1.07,
          strokeCap: StrokeCap.round,
          dashPattern:const [8, 4],
          child: Container(
            padding:const EdgeInsets.all(10),
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(Icons.image, size: 26),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Upload registration documents",
                    style: headline6.copyWith(
                        color: AppColors.brandColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Max upload size: 100 MB",
                    style: headline4.copyWith(
                        fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
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
                    name: tempFiles[index]['name'],
                    url: tempFiles[index]['url'],
                  );
          }),
        )
      ],
    );
  }
}
