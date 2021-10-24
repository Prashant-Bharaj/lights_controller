import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lights_controller/bed_room/widgets/large_box.dart';
import 'package:lights_controller/bed_room/widgets/small_box.dart';
import 'package:lights_controller/home/widgets/bottom_nav.dart';

import '../home/home.dart';
import 'widgets/color_circle.dart';


double _currentSliderValue = 0.0;
var bulbColor = Colors.yellow;

class BedRoom extends StatefulWidget {
  const BedRoom({Key? key}) : super(key: key);

  @override
  _BedRoomState createState() => _BedRoomState();
}

bool flag = false;

class _BedRoomState extends State<BedRoom> with TickerProviderStateMixin {
  double width = 30;
  late double steps = 20;
  void update() {
    Timer.periodic(const Duration(microseconds: 5000), (timer) {
      setState(
        () {
          _currentSliderValue < 100
              ? _currentSliderValue = _currentSliderValue + 5
              : timer.cancel();
          // steps < 350
          //     ? steps = steps + 20
          //     : timer.cancel();
          // if(!timer.isActive) {
          //   flag = true;
          // }
        },
      );
    });
  }

  late AnimationController _controller;
  late Animation animation;

  late AnimationController _controller2;
  late Animation animation2;

  late AnimationController _controller3;
  late Animation animation3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 200.0).animate(_controller);
    _controller.forward();
    _controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation2 = Tween(begin: 0.0, end: 200.0).animate(_controller2);
    _controller2.forward();

    _controller3 =
        AnimationController(vsync: this, duration: Duration(microseconds: 200));
    animation3 = Tween(begin: 0.0, end: 200.0).animate(_controller3);
    _controller3.forward();
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Stack(children: [
                          SvgPicture.asset(
                            'assets/icons/light bulb.svg',
                            color: bulbColor,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                          ),
                          SvgPicture.asset('assets/icons/Group 38.svg'),
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 49,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/Icon ionic-md-arrow-round-back.svg'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Bed",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Room",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "4 Lights",
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: AnimatedBuilder(
                    animation: _controller2,
                    builder: (context, child) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 220,
                          ),
                          Transform.translate(
                            offset: Offset(-animation2.value, 0),
                            child: const SmallBox(
                              icon: 'assets/icons/surface1.svg',
                              title: 'Main Light',
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(-animation2.value, 0),
                            child: const SmallBox(
                                icon:
                                    'assets/icons/furniture-and-household.svg',
                                title: 'Desk lights',
                                onClick: true),
                          ),
                          Transform.translate(
                            offset: Offset(-animation2.value, 0),
                            child: const SmallBox(
                              icon: 'assets/icons/bed (1).svg',
                              title: 'Bed lights',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  // color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      AnimatedBuilder(
                        animation: _controller3,
                        builder: (context, child) {
                          return SizedBox(
                            child: AnimatedContainer(
                              // color: Colors.white,
                              height: animation3.value * 0.5,
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                        child: Container(
                            height:
                                MediaQuery.of(context).size.height * 0.0781),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.84,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                        'assets/icons/Icon awesome-power-off.svg'),
                  ),
                ),
              ],
            ),
            Material(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      right: MediaQuery.of(context).size.height * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Intensity',
                            style: TextStyle(
                              fontSize: 22,
                              // color: Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset('assets/icons/solution2.svg'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Slider(
                                value: _currentSliderValue,
                                inactiveColor: Colors.grey,
                                activeColor: Colors.yellow,
                                thumbColor: Colors.white,
                                min: 0,
                                max: 100,
                                divisions: 6,
                                // label: _currentSliderValue.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _currentSliderValue = value;
                                  });
                                },
                              ),
                            ),
                            Stack(
                              children: [
                                SvgPicture.asset('assets/icons/solution1.svg'),
                                SvgPicture.asset(
                                  'assets/icons/solution1.svg',
                                  color: Colors.yellow
                                      .withOpacity(_currentSliderValue / 100),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Colors',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (flag == false)
                          TweenAnimationBuilder<double>(
                            // width: MediaQuery.of(context).size.width* 0.5,
                            onEnd: () {
                              setState(() {
                                flag = true;
                              });
                            },
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeOutQuart,
                            tween: Tween(
                                begin: MediaQuery.of(context).size.width * 0.2,
                                end: MediaQuery.of(context).size.width),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  // alignment: WrapAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AnimatedPositioned(
                                      // width: value* 0.0,
                                      duration:
                                          const Duration(microseconds: 100),
                                      child: buildInkWell(Colors.orange),
                                    ),
                                    AnimatedPositioned(
                                        width: value * 0.38,
                                        child: buildInkWell(Colors.green),
                                        duration:
                                            const Duration(microseconds: 300)),
                                    AnimatedPositioned(
                                        width: value * 0.36 * 1.739,
                                        child: buildInkWell(Colors.blueGrey),
                                        duration:
                                            const Duration(microseconds: 300)),
                                    AnimatedPositioned(
                                        width: value * 0.36 * 2.45,
                                        child: buildInkWell(Colors.deepPurple),
                                        duration:
                                            const Duration(microseconds: 300)),
                                    AnimatedPositioned(
                                        width: value * 0.36 * 3.2,
                                        child: buildInkWell(Colors.amber),
                                        duration:
                                            const Duration(microseconds: 300)),
                                    AnimatedPositioned(
                                        width: value * 0.36 * 3.9,
                                        child: const ColorCircle(
                                            color: Colors.white, icon: true),
                                        duration: Duration(microseconds: 300)),
                                  ],
                                ),
                              );
                            },
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildInkWell(Colors.orange),
                                buildInkWell(Colors.green),
                                buildInkWell(Colors.blueGrey),
                                buildInkWell(Colors.deepPurple),
                                buildInkWell(Colors.amber),
                                ColorCircle(color: Colors.white, icon: true),
                              ],
                            ),
                          ),
                        if (flag == true)
                          Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildInkWell(Colors.orange),
                                buildInkWell(Colors.green),
                                buildInkWell(Colors.blueGrey),
                                buildInkWell(Colors.deepPurple),
                                buildInkWell(Colors.amber),
                                ColorCircle(color: Colors.white, icon: true),
                              ],
                            ),
                          ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Scenes',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LargeBox(
                                title: 'Birthday',
                                icon: 'assets/icons/surface2.svg',
                                color: Colors.orange.shade200,
                              ),
                              AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Transform.translate(
                                    child: LargeBox(
                                      title: 'Party',
                                      icon: 'assets/icons/surface2.svg',
                                      color: Colors.deepPurpleAccent.shade100,
                                    ),
                                    offset: Offset(animation.value, 0),
                                  );
                                },
                                // child:
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LargeBox(
                                title: 'Relax',
                                icon: 'assets/icons/surface2.svg',
                                color: Colors.lightBlueAccent.shade100,
                              ),
                              AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Transform.translate(
                                    child: LargeBox(
                                      title: 'Fun',
                                      icon: 'assets/icons/surface2.svg',
                                      color: Colors.green.shade200,
                                    ),
                                    offset: Offset(animation.value, 0),
                                  );
                                },
                                // child:
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildInkWell(color) {
    return InkWell(
      child: ColorCircle(color: color),
      onTap: () {
        setState(() {
          bulbColor = color;
        });
      },
    );
  }
}
