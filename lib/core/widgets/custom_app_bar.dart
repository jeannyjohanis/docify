import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:docify/core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  final height = 100;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height.h,
      backgroundColor: ColorConstant.appBackground,
      title: title,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
