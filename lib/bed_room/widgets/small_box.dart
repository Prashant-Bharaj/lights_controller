import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SmallBox extends StatelessWidget {
  final String icon;
  final String title;
  final bool? onClick;
  const SmallBox({
    Key? key,
    required this.icon,
    required this.title,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color:
          onClick != null ? Color.fromARGB(999, 8, 8, 127) : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(icon),
              Text(
                title,
                style: TextStyle(
                    color: onClick == null
                        ? Color.fromARGB(999, 8, 8, 127)
                        : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}