import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../gen/fonts.gen.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool focused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: DynamicResize.dynamicWidth(screenWidth),
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          begin: Colors.transparent,
          end: focused ? Colors.white : ColorConstant.appBackground,
        ),
        duration: const Duration(milliseconds: 300),
        builder: (context, color, child) {
          return TextFormField(
            key: widget.key,
            controller: widget.textEditingController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontFamily: FontFamily.poppins,
              ),
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, color: ColorConstant.appTheme),
              filled: true,
              fillColor: color,
              hoverColor: Colors.transparent,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          );
        },
      ),
    );
  }
}
