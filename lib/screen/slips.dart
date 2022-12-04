// ignore_for_file: must_be_immutable

import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import '../model/slip.dart';
import '../utils/uis.dart';

class Slips extends StatelessWidget {
  Slips({super.key});
  static const String routeName = '/slips';
  String token = '';
  List<Bets> bets = [];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    bets = args['bets'];
    return Scaffold(
      appBar: appbar('စလစ်များ'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: _getSlip(context),
      ),
    );
  }

  Widget _getSlip(BuildContext context) {
    if (bets.isEmpty) {
      return Center(
        child: text(
          text: 'No Slip found.',
          family: 'Fira',
          size: 28,
        ),
      );
    }
    if (bets.isNotEmpty) {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     text(text: 'Vouncher No.'),
            //     text(text: ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                },
                children: [
                  tableRow(
                    r1: 'စဉ်',
                    r2: 'နံပါတ်',
                    r3: 'ထိုးကြေး',
                    r4: text(
                      text: 'ပေါက်',
                      family: 'Myanmar',
                      weight: FontWeight.bold,
                      color: ACCENT_3,
                    ),
                    fcolor: ACCENT_3,
                    fweight: FontWeight.bold,
                  ),
                  ...bets
                      .map(
                        (bet) => tableRow(
                          r1: (bets.indexOf(bet) + 1).toString(),
                          r2: bet.num,
                          r3: bet.amount.toString(),
                          r4: Icon(
                            Icons.pending,
                            color: Colors.grey,
                            size: 20,
                          ),
                          fcolor: Colors.white,
                        ),
                      )
                      .toList()
                  // tableRow(
                  //   r1: '1',
                  //   r2: '22',
                  //   r3: '500',
                  //   // r4: FaIcon(FontAwesomeIcons.cross),
                  //   r4: Icon(
                  //     Icons.check,
                  //     color: Colors.greenAccent,
                  //     size: 20,
                  //   ),
                  //   fcolor: Colors.white,
                  // ),
                  // tableRow(
                  //   r1: '2',
                  //   r2: '33',
                  //   r3: '500',
                  //   r4: Icon(
                  //     Icons.close,
                  //     color: Colors.redAccent,
                  //     size: 20,
                  //   ),
                  //   fcolor: Colors.white,
                  // ),
                  // tableRow(
                  //   r1: '3',
                  //   r2: '20',
                  //   r3: '18000',
                  //   r4: Icon(
                  //     Icons.pending,
                  //     color: Colors.grey,
                  //     size: 20,
                  //   ),
                  //   fcolor: Colors.white,
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
      // return ListView.builder(
      //   itemBuilder: (context, i) {
      //     return _slip(context, reverseList, i);
      //   },
      //   itemCount: reverseList.length,
      // );
    }

    return Center(
      child: text(
        text: 'Something was wrong',
        family: 'Fira',
        size: 28,
      ),
    );
  }

  // Container _slip(BuildContext context, List<Slip> list, int i) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //     margin: EdgeInsets.symmetric(
  //       vertical: 10,
  //       horizontal: 10,
  //     ),
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         width: 1,
  //         color: Colors.white12,
  //       ),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             text(
  //               text: list[i].id,
  //               family: 'Fira',
  //               size: 12,
  //               weight: FontWeight.bold,
  //             ),
  //             text(
  //               text: list[i].type,
  //               family: 'Fira',
  //               size: 22,
  //               weight: FontWeight.bold,
  //             ),
  //           ],
  //         ),
  //         Divider(
  //           indent: 10,
  //           endIndent: 10,
  //           color: Colors.white24,
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         ...list[i].bets.map((bet) {
  //           return _betNumRow(bet);
  //         }).toList(),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Divider(
  //           indent: 10,
  //           endIndent: 10,
  //           color: Colors.white24,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             text(text: 'စုစုပေါင်း', family: 'Myanmar'),
  //             SizedBox(
  //               width: 15,
  //             ),
  //             text(
  //               text: list[i].total.toString(),
  //               family: 'Fira',
  //               weight: FontWeight.bold,
  //               color: ACCENT_2,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Row _betNumRow(bet) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       text(
  //         text: bet['num'].toString(),
  //         family: 'Fira',
  //         weight: FontWeight.bold,
  //         color: ACCENT_2,
  //       ),
  //       text(
  //         text: ' - ',
  //         weight: FontWeight.bold,
  //         size: 22,
  //       ),
  //       text(
  //         text: bet['amount'].toString(),
  //         family: 'Fira',
  //         weight: FontWeight.bold,
  //         color: ACCENT_2,
  //       ),
  //     ],
  //   );
  // }
}
