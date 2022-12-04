// ignore_for_file: must_be_immutable

import 'package:app/model/lagers.dart';
import 'package:app/model/two_d.dart';
import 'package:app/screen/bet_page.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/twod_ui.dart';
import 'package:app/utils/uis.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TwoDSelect extends StatefulWidget {
  TwoDSelect({Key? key}) : super(key: key);

  static const String routeName = '/twod_select';

  @override
  State<TwoDSelect> createState() => _TwoDSelectState();
}

class _TwoDSelectState extends State<TwoDSelect> {
  List<BetType> twodList = getTwod();
  TextEditingController _amountController = TextEditingController(text: '100');
  List<BetType> betNumList = [];
  List<Map> betList = [];
  String? title, type, lagerId;
  List<Bets> bets = [];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    title = args['title'];
    lagerId = args['lagerId'];
    bets = args['bets'];

    twodList.forEach((twod) {
      bets.forEach((bet) {
        if (twod.number == bet.num) {
          twod.percent = ((bet.amount / bet.limit) * 100).toInt();
        }
      });
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: text(
          text: title ?? '',
          weight: FontWeight.bold,
          size: 26,
          family: 'Myanmar',
        ),
        actions: [
          Row(
            children: [
              text(
                text: 'ထိုးကြေး',
                family: 'Myanmar',
                weight: FontWeight.bold,
                size: 18,
              ),
              appbarTextField(controller: _amountController),
              const SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 5,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: ((context, index) => Center(
                      child: twothreeDUi(
                        twoD: twodList[index],
                        cb: () {
                          v();
                          twodList[index].choosen = !twodList[index].choosen;
                          setState(() {});
                        },
                      ),
                    )),
                itemCount: twodList.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              height: 70,
              child: CustomButton(
                title: 'ထိုးမည်',
                color: SECONDARY_COLOR,
                cb: () {
                  htoeml(context, type);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void htoeml(BuildContext context, String? type) {
    v();
    // print(int.parse(_amountController.value.text));
    if (_amountController.value.text == '') {
      toastFlash(context, 'ထိုးမည့်ပမာဏအားထည့်သွင်းပါ');
      return;
    }
    if (int.parse(_amountController.value.text) % 50 != 0 ||
        int.parse(_amountController.value.text) < 100) {
      toastFlash(context, '100 ဆမှစ၍သာထိုးပါ');
      return;
    }

    twodList.forEach((n) {
      n.stake = int.parse(_amountController.value.text);
    });

    for (var twod in twodList) {
      if (twod.choosen) {
        betNumList.add(twod);
      }
    }
    if (betNumList.isNotEmpty) {
      Navigator.of(context).pushNamed(BetPage.routeName, arguments: {
        'betNumList': betNumList,
        'lagerId': lagerId,
        // 'type': type,
      });
      betNumList = [];
    } else {
      toastFlash(context, 'ထိုးမည့်နံပါတ်ရွေးချယ်ပါ');
    }
  }
}
