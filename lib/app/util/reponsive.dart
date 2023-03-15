import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

getHalfWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / 2;
}

getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getQuarterWidth(BuildContext context) {
  return ((MediaQuery.of(context).size.width) * 3 / 4);
}

getOneFourthWidth(BuildContext context) {
  return ((MediaQuery.of(context).size.width) / 4);
}

getHalfHeight(BuildContext context) {
  return MediaQuery.of(context).size.height / 2;
}

getQuarterHeight(BuildContext context) {
  return ((MediaQuery.of(context).size.height) / 2) * 3;
}

getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getHeightWithoutAppbarSize(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewInsets.bottom -
      getAppbarStatusBar(context) -
      80;
}

getHeightKeyboard(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

double getStatusbarSize(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

getOneFourthHeight(BuildContext context) {
  return ((MediaQuery.of(context).size.height) / 3) * 2;
}

getAppbarStatusBar(BuildContext context) {
  return AppBar().preferredSize.height + MediaQuery.of(context).viewPadding.top;
}

getAppbar(BuildContext context) {
  return AppBar().preferredSize.height;
}

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}

typedef void OnWidgetSizeChange(Size size);
