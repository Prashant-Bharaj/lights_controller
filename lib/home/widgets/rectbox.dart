import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RectangleBox extends StatelessWidget {
  final String icon;
  final String room;
  final int lights;
  const RectangleBox({
    Key? key,
    required this.icon,
    required this.room,
    required this.lights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/BedRoom'),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          elevation: 3.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.43,
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [SvgPicture.asset(icon)],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Text(
                    room,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$lights Lights',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xfff1b44d),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
