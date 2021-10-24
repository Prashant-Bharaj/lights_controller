import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:lights_controller/home/widgets/rectbox.dart';

import 'widgets/bottom_nav.dart';

var circles = 'assets/icons/Circles.svg';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      backgroundColor: const Color(0xff104296),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    circles,
                    fit: BoxFit.none,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Control\nPanel',
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Stack(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundImage:
                                        AssetImage('assets/images/avatar.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffbb33),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 15,
                                    minHeight: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'All Rooms',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      RectangleBox(
                        icon: 'assets/icons/bed.svg',
                        room: "Bed room",
                        lights: 4,
                      ),
                      RectangleBox(
                        icon: 'assets/icons/room.svg',
                        room: "Living room",
                        lights: 2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      RectangleBox(
                        icon: 'assets/icons/kitchen.svg',
                        room: "Kitchen",
                        lights: 5,
                      ),
                      RectangleBox(
                        icon: 'assets/icons/bathtube.svg',
                        room: "Bathroom",
                        lights: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      RectangleBox(
                        icon: 'assets/icons/house.svg',
                        room: "Outdoor",
                        lights: 5,
                      ),
                      RectangleBox(
                        icon: 'assets/icons/balcony.svg',
                        room: "Balcony",
                        lights: 4,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
