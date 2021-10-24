import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ColorCircle extends StatelessWidget {
  final color;
  final bool? icon;
  const ColorCircle({
    Key? key,
    required this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: CircleAvatar(
        backgroundColor: color,
        child:
        icon != null ? SvgPicture.asset('assets/icons/+.svg') : Container(),
      ),
    );
  }
}