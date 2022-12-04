// ignore_for_file: must_be_immutable

import 'package:app/screen/body.dart';
import 'package:app/screen/moung.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/constants.dart';
import '../utils/uis.dart';

class BalloneScreen extends StatefulWidget {
  BalloneScreen({Key? key}) : super(key: key);

  static const String routeName = '/ballone';

  @override
  State<BalloneScreen> createState() => _BalloneScreenState();
}

class _BalloneScreenState extends State<BalloneScreen> {
  List<Widget> _ballone = [
    Body(),
    Moung(),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Row(
          children: [
            text(
              text: BALLONE,
              family: 'Myanmar',
              weight: FontWeight.bold,
              size: 26,
            ),
            const SizedBox(
              width: 5,
            ),
            FaIcon(
              FontAwesomeIcons.futbol,
              size: 20,
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: ElevatedButton(
              onPressed: () => setState(() {
                _pageIndex = 0;
              }),
              child: text(
                text: 'ဘော်ဒီ',
                family: 'Myanmar',
                weight: FontWeight.bold,
                size: 16,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _pageIndex == 0 ? ACCENT_2 : SECONDARY_COLOR,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: ElevatedButton(
              onPressed: () => setState(() {
                _pageIndex = 1;
              }),
              child: text(
                text: 'မောင်း',
                family: 'Myanmar',
                weight: FontWeight.bold,
                size: 16,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _pageIndex == 1 ? ACCENT_2 : SECONDARY_COLOR,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: _ballone[_pageIndex],
      ),
    );

    // return DefaultTabController(
    //   length: _ballone.length,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: PRIMARY_COLOR,
    //       title: Row(
    //         children: [
    //           text(
    //             text: BALLONE,
    //             family: 'Myanmar',
    //             weight: FontWeight.bold,
    //             size: 26,
    //           ),
    //           const SizedBox(
    //             width: 5,
    //           ),
    //           FaIcon(
    //             FontAwesomeIcons.futbol,
    //             size: 20,
    //           )
    //         ],
    //       ),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: text(
    //               text: 'ဘော်ဒီ',
    //               family: 'Myanmar',
    //               weight: FontWeight.bold,
    //               size: 16,
    //             ),
    //           ),
    //           Tab(
    //             icon: text(
    //               text: 'မောင်း',
    //               family: 'Myanmar',
    //               weight: FontWeight.bold,
    //               size: 16,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height,
    //       decoration: BoxDecoration(
    //         gradient: gradient(),
    //       ),
    //       child: TabBarView(
    //         children: _ballone,
    //       ),
    //     ),
    //   ),
    // );
  }
}
