import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:docify/features/landing/presentation/widgets/custom_search_bar.dart';
import 'package:docify/gen/assets.gen.dart';
import 'package:docify/gen/fonts.gen.dart';

import '../../../../core/core.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorConstant.appBackground,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildLeftPanel(),
          Flexible(
            child: Column(
              children: [
                _buildActionBar(),
                _buildBody(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 100.h,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20).r,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: CustomSearchBar(
                textEditingController: TextEditingController(),
              ),
            ),
            _buildIconButtonWithIndicator(Icons.chat_bubble),
            Padding(
              padding: const EdgeInsets.only(right: 50).r,
              child: _buildIconButtonWithIndicator(Icons.alarm, count: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftPanel() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 200.h,
          width: 200.w,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Assets.images.landing.docifyLogo.svg(height: 180.h),
          ),
        ),
        _buildLeftNavigationMenu()
      ],
    );
  }

  Widget _buildIconButtonWithIndicator(IconData icon, {VoidCallback? onPressed, int count = 0}) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              icon,
              color: ColorConstant.appTheme,
              size: 30,
            ),
          ),
        ),
        count == 0
            ? const SizedBox.shrink()
            : Positioned(
                right: 0,
                child: _buildIndicator(count),
              ),
      ],
    );
  }

  Widget _buildIndicator(int count) {
    String countString = count.toString();
    if (count > 10) {
      countString = '10+';
    }
    return Container(
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Center(
        child: Text(countString,
            style: TextStyle(
              fontFamily: FontFamily.poppins,
              color: Colors.white,
              fontSize: 10.sp,
            )),
      ),
    );
  }

  Widget _buildLeftNavigationMenu() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15).r,
        width: 250.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
          ),
          color: ColorConstant.appTheme,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMenuItem('Dashboard', Icons.dashboard_outlined),
            _buildMenuItem('Tasks & Events', Icons.date_range),
            _buildMenuItem('Cases', Icons.cases_outlined),
            _buildMenuItem('Settings', Icons.settings_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25).r,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontFamily: FontFamily.poppins),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return const SizedBox.shrink();
  }
}
