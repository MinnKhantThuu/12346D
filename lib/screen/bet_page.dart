import 'package:app/model/two_d.dart';
import 'package:app/screen/confirm_page.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/uis.dart';
import '../widgets/custom_button.dart';

class BetPage extends StatefulWidget {
  const BetPage({Key? key}) : super(key: key);
  static const String routeName = '/twod_bet';

  @override
  State<BetPage> createState() => _BetPageState();
}

class _BetPageState extends State<BetPage> {
  List betList = [];
  int totalAmount = 0;
  String betNum = '';
  String lagerId = '';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<BetType> numbers = args['betNumList'];
    lagerId = args['lagerId'];
    return Scaffold(
      appBar: appbar(
        'ထိုးကြေးတင်မည်',
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
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
                      r4: text(
                        text: 'ပြင်',
                        family: 'Myanmar',
                        weight: FontWeight.bold,
                        color: ACCENT_3,
                      ),
                      r5: text(
                        text: 'ဖျတ်',
                        family: 'Myanmar',
                        weight: FontWeight.bold,
                        color: ACCENT_3,
                      ),
                      fcolor: ACCENT_3,
                      fweight: FontWeight.bold,
                    ),
                  ],
                ),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(4),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  children: numbers
                      .map(
                        (num) => tableRow(
                          r1: (numbers.indexOf(num) + 1).toString(),
                          r2: num.number.toString(),
                          r3: num.stake.toString(),
                          r4: GestureDetector(
                            onTap: () {
                              v();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert(num);
                                },
                              );
                              // .then(
                              //   (val) {
                              //     // List<String> val = value.split(":");
                              //     print("Amount ${val[0]}");
                              //     print("Number ${val[1]}");
                              //     numbers.forEach((n) {
                              //       if (n.number.toString() ==
                              //           val[1].toString()) {
                              //         print(n.number);
                              //         setState(() {
                              //           n.amount = val[0];
                              //         });
                              //       }
                              //     });
                              //   },
                              // );
                            },
                            child: Icon(
                              Icons.edit_note,
                              size: 26,
                              color: ACCENT_3,
                            ),
                          ),
                          r5: GestureDetector(
                            onTap: () {
                              v();
                              if (numbers.length > 1) {
                                numbers.removeAt(numbers.indexOf(num));
                              } else {
                                Navigator.of(context).pop();
                              }
                              setState(() {});
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
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  height: 70,
                  child: CustomButton(
                    title: 'သေချာပြီ',
                    color: SECONDARY_COLOR,
                    cb: () {
                      v();
                      numbers.forEach((bet) => totalAmount += bet.stake);
                      numbers.forEach((bet) => betNum += '${bet.number} ');
                      Navigator.of(context)
                          .pushNamed(ConfirmPage.routeName, arguments: {
                        'bets': numbers,
                        // 'type': type,
                        'lagerId': lagerId,
                        'totalAmount': totalAmount,
                        'betNum': betNum,
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AlertDialog alert(BetType twod) {
    TextEditingController _amountController =
        TextEditingController(text: twod.stake.toString());
    return AlertDialog(
      elevation: 5,
      backgroundColor: Color(0xff3D4085),
      title: Center(
        child: text(
          text: 'ထိုးကြေးပြောင်းရန်',
          family: 'Myanmar',
          size: 26,
          weight: FontWeight.bold,
        ),
      ),
      content: Container(
        width: 250,
        height: 120,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  text: 'ထိုးဂဏန်း',
                  color: Colors.white,
                  family: 'Myanmar',
                  size: 22,
                ),
                const SizedBox(
                  width: 15,
                ),
                text(
                  text: twod.number,
                  family: 'Fira',
                  color: ACCENT_3,
                  size: 26,
                  weight: FontWeight.bold,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff815EE3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: text(
                      text: 'ပမာဏ',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  width: 150,
                  height: 60,
                  // color: Colors.black,
                  child: TextField(
                    autofocus: true,
                    cursorColor: Colors.white,
                    textAlign: TextAlign.end,
                    controller: _amountController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Fira',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      fillColor: Color(0xff1B1C4C),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (_amountController.value.text == '') {
                toastFlash(context, 'ထိုးမည့်ပမာဏအားထည့်သွင်းပါ');
                return;
              }
              if (int.parse(_amountController.value.text) % 50 != 0 ||
                  int.parse(_amountController.value.text) < 100) {
                toastFlash(context, '100 ဆမှစ၍သာထိုးပါ');
                return;
              }
              setState(() {
                twod.stake = int.parse(_amountController.value.text);
              });
              Navigator.of(context).pop();
              // .pop([_amountController.value.text, twod.number]);
              // .pop(_amountController.value.text + ":" + twod.number);
            },
            child: text(
              text: 'ပြောင်းမယ်',
              family: 'Myanmar',
            )),
      ],
    );
  }
}
