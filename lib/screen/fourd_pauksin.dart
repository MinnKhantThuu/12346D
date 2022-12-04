import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/uis.dart';

class FourDPaukSin extends StatelessWidget {
  const FourDPaukSin({Key? key}) : super(key: key);
  static const String routeName = '/fourdpauksin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('ပေါက်စဉ်'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Table(
                  children: [
                    tableRow(
                        r1: 'အမျိုးအစား',
                        r2: 'အချိန်',
                        r3: 'ပေါက်ဂဏန်း',
                        fcolor: ACCENT_3,
                        fweight: FontWeight.bold),
                    rowSpacer,
                    tableRow(r1: 'စင်္ကာပူ', r2: '5:30PM', r3: '-'),
                    rowSpacer,
                    tableRow(r1: 'ကမ္ဘောဒီးယား', r2: '5:40PM', r3: '7777'),
                    rowSpacer,
                    tableRow(r1: 'လာအို', r2: '5:30PM', r3: '8777'),
                  ],
                ),
              ),
              text(
                text: 'မလေးရှား',
                weight: FontWeight.bold,
                size: 30,
                family: 'Myanmar',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Table(
                  // columnWidths: {0: FractionColumnWidth(.4)},
                  // defaultColumnWidth: FixedColumnWidth(150.0),
                  children: [
                    tableRow(
                        r1: 'အမျိုးအစား',
                        r2: 'အချိန်',
                        r3: 'ပေါက်ဂဏန်း',
                        fcolor: ACCENT_3,
                        fweight: FontWeight.bold),
                    rowSpacer,
                    tableRow(r1: 'Magnum', r2: '5:30PM', r3: '-'),
                    rowSpacer,
                    tableRow(r1: 'Damacai', r2: '5:40PM', r3: '7667'),
                    rowSpacer,
                    tableRow(r1: 'ToTo', r2: '5:30PM', r3: '8667'),
                    rowSpacer,
                    tableRow(r1: 'Sabah88', r2: '5:30PM', r3: '-'),
                    rowSpacer,
                    tableRow(r1: 'Sarawak', r2: '5:40PM', r3: '7447'),
                    rowSpacer,
                    tableRow(r1: 'Sandakan', r2: '5:30PM', r3: '8667'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
