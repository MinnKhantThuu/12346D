// ignore_for_file: must_be_immutable

import 'package:app/model/two_d.dart';
import 'package:app/screen/bet_page.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/uis.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../model/lagers.dart';
import '../utils/twod_ui.dart';

class ThreeDSelect extends StatefulWidget {
  ThreeDSelect({Key? key}) : super(key: key);

  static const String routeName = '/threed_select';

  @override
  State<ThreeDSelect> createState() => _ThreeDSelectState();
}

class _ThreeDSelectState extends State<ThreeDSelect> {
  TextEditingController _amountController = TextEditingController(text: '100');
  List<BetType> betNumList = [];
  List<Map> betList = [];
  String? title;
  int _pageIndex = 0;
  String? lagerId;
  List<Bets> bets = [];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    title = args['title'];
    lagerId = args['lagerId'];
    bets = args['bets'];
    threeDAllList.forEach((threeDList) {
      threeDList.forEach((threeD) {
        bets.forEach((bet) {
          if (threeD.number == bet.num) {
            threeD.percent = ((bet.amount / bet.limit) * 100).toInt();
          }
        });
      });
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            threeDAllList.forEach((threeD) {
              threeD.forEach((element) {
                element.choosen = false;
                setState(() {});
              });
            });
            Navigator.of(context).pop();
          },
        ),
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
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: SizedBox(
                      width: 80,
                      height: 40,
                      child: ElevatedButton(
                        child: text(
                          text: (i * 100).toString().padLeft(3, '0'),
                          family: 'Fira',
                        ),
                        onPressed: () {
                          v();
                          setState(() {
                            _pageIndex = i;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _pageIndex == i ? ACCENT_2 : SECONDARY_COLOR,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.white12,
            ),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: ((context, index) => Center(
                      child: twothreeDUi(
                        twoD: threeDAllList[_pageIndex][index],
                        cb: () {
                          v();
                          threeDAllList[_pageIndex][index].choosen =
                              !threeDAllList[_pageIndex][index].choosen;
                          setState(() {});
                        },
                      ),
                    )),
                itemCount: threeDAllList[_pageIndex].length,
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
                cb: () => _htoeMl(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _htoeMl(BuildContext context) {
    v();
    if (_amountController.value.text == '') {
      toastFlash(context, 'ထိုးမည့်ပမာဏအားထည့်သွင်းပါ');
      return;
    }
    if (int.parse(_amountController.value.text) % 50 != 0 ||
        int.parse(_amountController.value.text) < 100) {
      toastFlash(context, '100 ဆမှစ၍သာထိုးပါ');
      return;
    }

    threeDAllList.forEach((threeDList) => {
          threeDList.forEach((threeD) {
            threeD.stake = int.parse(_amountController.value.text);
          })
        });

    threeDAllList.forEach((threeDList) {
      threeDList.forEach((threeD) {
        if (threeD.choosen) {
          betNumList.add(threeD);
        }
      });
    });

    if (betNumList.isNotEmpty) {
      Navigator.of(context).pushNamed(BetPage.routeName,
          arguments: {'betNumList': betNumList, 'lagerId': lagerId});
      print(betNumList);
      betNumList = [];
    } else {
      toastFlash(context, 'ထိုးမည့်နံပါတ်ရွေးချယ်ပါ');
    }
  }
}
