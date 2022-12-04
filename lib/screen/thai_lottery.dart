import 'dart:convert';

import 'package:app/model/lagers.dart';
import 'package:app/provider/lager_provider.dart';
import 'package:app/screen/slips.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/slip.dart';
import '../provider/auth_provider.dart';
import '../provider/slip_provider.dart';
import '../utils/api.dart';
import '../utils/api_status.dart';
import '../utils/uis.dart';
import 'home.dart';

class ThaiLottery extends StatefulWidget {
  ThaiLottery({super.key});
  static const String routeName = '/thai_lottery';

  @override
  State<ThaiLottery> createState() => _ThaiLotteryState();
}

class _ThaiLotteryState extends State<ThaiLottery> {
  TextEditingController _firstController = TextEditingController();

  TextEditingController _secondController = TextEditingController();

  TextEditingController _thirdController = TextEditingController();

  TextEditingController _fourthController = TextEditingController();

  TextEditingController _fifthController = TextEditingController();

  TextEditingController _sixthController = TextEditingController();

  List sixD = [];
  String sixDString = '';
  List<Lagers> sixDLagers = [];
  List<Slip> slips = [];
  String _startDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String _endDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    sixDLagers = context.watch<LagerProvider>().sixDLager;
    // print(sixDLagers[0].bets[0].num);
    return Scaffold(
      appBar: appbar('ထိုင်းထီ'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: _getSixDLagers(context),
      ),
    );
  }

  Widget _getSixDLagers(BuildContext context) {
    if (sixDLagers.isNotEmpty) {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                text(
                  text: 'ထိုးမည့်နံပါတ်အားရမရ ရိုက်ထည့်ကာ စစ်ဆေးပါ',
                  family: 'Myanmar',
                  color: ACCENT_2,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    oneCellInput(context, _firstController),
                    oneCellInput(context, _secondController),
                    oneCellInput(context, _thirdController),
                    oneCellInput(context, _fourthController),
                    oneCellInput(context, _fifthController),
                    oneCellInput(context, _sixthController),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: CustomButton(
                    title: 'စစ်ဆေးမည်',
                    color: SECONDARY_COLOR,
                    cb: () {
                      v();
                      sixDString += _firstController.value.text;
                      sixDString += _secondController.value.text;
                      sixDString += _thirdController.value.text;
                      sixDString += _fourthController.value.text;
                      sixDString += _fifthController.value.text;
                      sixDString += _sixthController.value.text;
                      if (sixDString.length == 6) {
                        // sixDLagers.forEach((sixDLager) {
                        // sixDLagers[0].bets.forEach((bet) {
                        //   if (bet.num == sixDString) {
                        //     toastFlash(context,
                        //         'တခြားသူထိုးယူပြီးသောနံပါတ်ဖြစ်ပါသည် တခြားနံပါတ်အားပြန်လည်ရွေးယူပါ');

                        //   } else {
                        //     sixD.add(sixDString);
                        //     sixD = sixD.toSet().toList();
                        //   }
                        //   _firstController.text = '';
                        //   _secondController.text = '';
                        //   _thirdController.text = '';
                        //   _fourthController.text = '';
                        //   _fifthController.text = '';
                        //   _sixthController.text = '';
                        // });
                        // });
                        for (var bet in sixDLagers[0].bets) {
                          if (bet.num == sixDString) {
                            toastFlash(context,
                                'တခြားသူထိုးယူပြီးသောနံပါတ်ဖြစ်ပါသည် တခြားနံပါတ်အားပြန်လည်ရွေးယူပါ');
                            break;
                          } else {
                            sixD.add(sixDString);
                            sixD = sixD.toSet().toList();
                          }
                          _firstController.text = '';
                          _secondController.text = '';
                          _thirdController.text = '';
                          _fourthController.text = '';
                          _fifthController.text = '';
                          _sixthController.text = '';
                        }
                      } else {
                        toastFlash(context, 'ဂဏန်း၆လုံးပြည့်အောင်ရိုက်ထည့်ပါ');
                      }
                      sixDString = '';
                      setState(() {});
                      // print(sixD.toSet().toList());
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            if (sixD.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Table(
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(4),
                        3: FlexColumnWidth(2),
                        4: FlexColumnWidth(2),
                      },
                      children: [
                        tableRow(
                          r1: 'စဉ်',
                          r2: 'နံပါတ်',
                          r3: 'ပမာဏ',
                          r5: text(
                            text: 'ဖျတ်',
                            family: 'Myanmar',
                            weight: FontWeight.bold,
                            color: ACCENT_3,
                          ),
                          fcolor: ACCENT_3,
                          fweight: FontWeight.bold,
                        ),
                        ...sixD
                            .map(
                              (six) => tableRow(
                                r1: (sixD.indexOf(six) + 1).toString(),
                                r2: six.toString(),
                                r3: '2000',
                                r5: GestureDetector(
                                  onTap: () {
                                    v();
                                    setState(() {
                                      sixD.removeAt(sixD.indexOf(six));
                                    });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    size: 26,
                                    color: ACCENT_3,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 70,
                      child: CustomButton(
                        title: 'သေချာပြီ',
                        color: SECONDARY_COLOR,
                        cb: () async {
                          v();
                          // print(sixDLagers[0].id);
                          List sixDBet = sixD
                              .map((six) => Thai(num: six, amount: 2000))
                              .toList();
                          var jsonBet = jsonEncode({
                            "lagerId": sixDLagers[0].id,
                            "bets": sixDBet,
                          });
                          var token =
                              Provider.of<AuthProvider>(context, listen: false)
                                  .user
                                  .token;
                          Object resObj = await Api.post(
                              url: '/bet/two', json: jsonBet, token: token);
                          if (resObj is Success) {
                            List lisy = resObj.response as List;
                            String token = Provider.of<AuthProvider>(context,
                                    listen: false)
                                .user
                                .token;

                            await Provider.of<LagerProvider>(context,
                                    listen: false)
                                .getAllLagers(token: token);
                            await Provider.of<SlipProvider>(context,
                                    listen: false)
                                .getSlips(
                                    token: token,
                                    startDate: _startDate,
                                    endDate: _endDate);
                            slips = Provider.of<SlipProvider>(context,
                                    listen: false)
                                .slips;
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return WillPopScope(
                                  onWillPop: () => Future.value(false),
                                  child: AlertDialog(
                                    backgroundColor: Color(0xff3D4085),
                                    title: Center(
                                      child: text(
                                        text: 'အောင်မြင်ပါသည်',
                                        family: 'Myanmar',
                                        weight: FontWeight.bold,
                                        size: 26,
                                      ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: lisy.map((list) {
                                          return text(
                                            text: list,
                                            family: 'Myanmar',
                                            size: 14,
                                            weight: FontWeight.bold,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          // Navigator.of(context)
                                          //     .pushNamedAndRemoveUntil(
                                          //         Vouncher.routeName,
                                          //         ModalRoute.withName(
                                          //             Home.routeName));
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                            Slips.routeName,
                                            ModalRoute.withName(Home.routeName),
                                            arguments: {
                                              'bets': slips.last.bets,
                                            },
                                          );
                                        },
                                        child: text(text: 'OK'),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Color(0xff3D4085),
                                  title: text(text: 'Ma Aung Buu'),
                                );
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      );
    }
    return Center(
      child: text(
        text: 'ထိုင်းထီအားထိုး၍မရနိုင်သေးပါ',
        family: 'Myanmar',
        color: ACCENT_2,
        size: 18,
        weight: FontWeight.bold,
      ),
    );
  }
}

class Thai {
  String num;
  int amount;
  Thai({
    required this.num,
    required this.amount,
  });

  Map<String, dynamic> toJson() => {
        "num": num,
        "amount": amount,
      };
}
