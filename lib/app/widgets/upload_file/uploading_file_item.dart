import 'package:bloc_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UploadingFileItem extends StatelessWidget {
  final int percentage;
  final String name;
  final void Function() onCancel;
  const UploadingFileItem(
      {Key? key,
      required this.percentage,
      required this.name,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, snapshot) {
      return Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(
              color: AppColors.borderGreyColor,
              width: 1.5,
            )),
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const Icon(Icons.image, size: 50),
                    Text(
                      "${extension("$name")}",
                      style: TextStyle(
                        fontSize: 7.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Uploading $percentage%"),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onCancel,
                  icon: Icon(
                    Icons.close,
                    size: 22,
                    color: AppColors.grayNormal,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Row(
              children: [
                Container(
                  width: (200 - 30) * percentage / 100,
                  decoration: BoxDecoration(
                    color: AppColors.grayLight.withOpacity(0.5),
                  ),
                ),
                Spacer()
              ],
            ),
          )
        ],
      );
    });
  }
}
