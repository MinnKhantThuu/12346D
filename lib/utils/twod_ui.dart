import 'package:app/model/two_d.dart';
import 'package:app/utils/uis.dart';
import 'package:flutter/material.dart';

Widget twothreeDUi({
  required BetType twoD,
  required Function cb,
}) {
  double _percentBar = 35;
  return GestureDetector(
    onTap: () => cb(),
    child: Stack(
      children: [
        Container(
          // padding: twoD.choosen ? EdgeInsets.zero : EdgeInsets.all(5),
          width: twoD.choosen ? 50 : 45,
          height: twoD.choosen ? 50 : 45,
          decoration: BoxDecoration(
            color: twoD.choosen ? Color(0xff815EE3) : Color(0xff3F9BDA),
            borderRadius: BorderRadius.circular(5),
            border: twoD.choosen
                ? Border.all(width: 1, color: Color(0xff1E2055))
                : Border.all(
                    width: 0,
                    color: Colors.transparent,
                  ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  text: twoD.number,
                  family: 'Fira',
                  size: 20,
                  color: twoD.choosen ? Color(0xffF59882) : Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _percentBar,
                      child: Stack(
                        children: [
                          if (twoD.percent > 30)
                            Container(
                              width: _percentBar,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          if (twoD.percent > 30 && twoD.percent < 51)
                            Container(
                              // width: 30,
                              width: (_percentBar / 100) * twoD.percent,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0,
                                ),
                              ),
                            ),
                          if (twoD.percent > 50 && twoD.percent < 81)
                            Container(
                              // width: 30,
                              width: (_percentBar / 100) * twoD.percent,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0,
                                ),
                              ),
                            ),
                          if (twoD.percent > 80)
                            Container(
                              // width: 30,
                              width: (_percentBar / 100) * twoD.percent,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fourDUi({
  required BetType twoD,
  required Function cb,
}) {
  double _percentBar = 35;
  return GestureDetector(
    onTap: () => cb(),
    child: Stack(
      children: [
        Container(
          // padding: twoD.choosen ? EdgeInsets.zero : EdgeInsets.all(5),
          width: twoD.choosen ? 55 : 50,
          height: twoD.choosen ? 55 : 50,
          decoration: BoxDecoration(
            color: twoD.choosen ? Color(0xff815EE3) : Color(0xff3F9BDA),
            borderRadius: BorderRadius.circular(5),
            border: twoD.choosen
                ? Border.all(width: 1, color: Color(0xff1E2055))
                : Border.all(
                    width: 0,
                    color: Colors.transparent,
                  ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  text: twoD.number,
                  family: 'Fira',
                  size: 20,
                  color: twoD.choosen ? Color(0xffF59882) : Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _percentBar,
                      child: Stack(
                        children: [
                          if (twoD.percent > 30)
                            Container(
                              width: _percentBar,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          if (twoD.percent > 30 && twoD.percent < 51)
                            Container(
                              // width: 30,
                              width: (_percentBar / 100) * twoD.percent,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0,
                                ),
                              ),
                            ),
                          if (twoD.percent > 50 && twoD.percent < 81)
                            Container(
                              // width: 30,
                              width: (_percentBar / 100) * twoD.percent,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0,
                                ),
                              ),
                            ),
                          if (twoD.percent > 80)
                            Container(
                              // width: 30,
                              width: (_percentBar / 100) * twoD.percent,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
