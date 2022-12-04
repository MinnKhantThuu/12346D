// ignore_for_file: must_be_immutable

import 'package:app/model/ballone.dart';
import 'package:app/utils/ball_ui.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../utils/uis.dart';

class GuessWinAmount extends StatelessWidget {
  GuessWinAmount({super.key});
  static const String routeName = '/guess_win_amount';
  // List<Ballone> body = [];
  // List<Ballone> moung = [];
  String type = '';
  List<Ballone> matches = [];
  double amount = 0;
  double total = 0;
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    type = args['type'];
    matches = args['matchList'];
    amount = args['amount'].toDouble();
    total = args['amount'].toDouble();
    matches.forEach((match) {
      if (match.awaySelected) {
        print(match.hdpAway);
        total += total * match.hdpAway;
      }
      if (match.homeSelected) {
        total += total * match.hdpHome;
      }
      if (match.overSelected) {
        total += total * match.ouOver;
      }
      if (match.underSelected) {
        total += total * match.ouUnder;
      }
      print(total);
    });
    return Scaffold(
      appBar: appbar('ခန့်မှန်းနိုင်ချေ'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: type == 'moung'
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: leagueTitle(
                                leagueName: 'ရွေးချယ်ထားသောမောင်းများ'),
                            children: matches
                                .map((match) => pwalSin(
                                      goal: '0',
                                      blone: match,
                                      body: '0',
                                    ))
                                .toList(),
                          );
                        },
                        itemCount: 1,
                      )
                    : Column(
                        children: [
                          leagueTitle(leagueName: 'ရွေးချယ်ထားသောဘော်ဒီပွဲစဉ်'),
                          ...matches
                              .map((match) => pwalSin(
                                    goal: '0',
                                    blone: match,
                                    body: '0',
                                    homeCb: () {},
                                    awayCb: () {},
                                    overCb: () {},
                                    underCb: () {},
                                  ))
                              .toList()
                        ],
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  text(
                    text: 'ထိုးကြေး',
                    family: 'Myanmar',
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: SECONDARY_COLOR,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: text(
                        text: amount.toInt().toString(),
                        family: 'Fira',
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  text(
                    text: 'ခန့်မှန်းနိုင်ချေ',
                    family: 'Myanmar',
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: SECONDARY_COLOR,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: text(
                        text: total.toInt().toString(),
                        family: 'Fira',
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      title: 'ထိုးမည်',
                      fsize: 16,
                      width: 100,
                      height: 45,
                      color: ACCENT_3,
                      cb: () {
                        v();
                      })
                ],
              )
            ],
          ),
        ),
        //     SingleChildScrollView(
        //   physics: BouncingScrollPhysics(),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         ExpansionTile(
        //           title: text(text: 'text'),
        //           // trailing: leagueTitle(leagueName: 'ရွေးချယ်ထားသောမောင်းများ'),
        //         ),
        //         // if (type == 'moung')
        //         //   leagueTitle(leagueName: 'ရွေးချယ်ထားသောမောင်းများ'),
        //         // if (type == 'body')
        //         //   leagueTitle(leagueName: 'ရွေးချယ်ထားသောဘော်ဒီပွဲ'),
        // Column(
        //   children: matches
        //       .map((match) => pwalSin(
        //             goal: '0',
        //             blone: match,
        //             body: '0',
        //             homeCb: () {},
        //             awayCb: () {},
        //             overCb: () {},
        //             underCb: () {},
        //           ))
        //       .toList(),
        // ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             text(
        //               text: 'ထိုးကြေး',
        //               family: 'Myanmar',
        //               weight: FontWeight.bold,
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Container(
        //               width: 120,
        //               height: 50,
        //               decoration: BoxDecoration(
        //                 color: SECONDARY_COLOR,
        //                 borderRadius: BorderRadius.circular(5),
        //               ),
        //               child: Center(
        //                 child: text(
        //                   text: amount.toInt().toString(),
        //                   family: 'Fira',
        //                   weight: FontWeight.bold,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             text(
        //               text: 'ခန့်မှန်းနိုင်ချေ',
        //               family: 'Myanmar',
        //               weight: FontWeight.bold,
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Container(
        //               width: 120,
        //               height: 50,
        //               decoration: BoxDecoration(
        //                 color: SECONDARY_COLOR,
        //                 borderRadius: BorderRadius.circular(5),
        //               ),
        //               child: Center(
        //                 child: text(
        //                   text: total.toInt().toString(),
        //                   family: 'Fira',
        //                   weight: FontWeight.bold,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             CustomButton(
        //                 title: 'ထိုးမည်',
        //                 fsize: 16,
        //                 width: 100,
        //                 height: 45,
        //                 color: ACCENT_3,
        //                 cb: () {
        //                   v();
        //                 })
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
