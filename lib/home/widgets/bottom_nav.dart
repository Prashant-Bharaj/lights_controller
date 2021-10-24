import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/bulb.svg'), label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Icon feather-home.svg'),
            label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Icon feather-settings.svg'),
            label: ''),
      ],
    );
  }
}
