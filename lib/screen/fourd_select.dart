import 'package:app/screen/bet_page.dart';
import 'package:flutter/material.dart';

import '../model/lagers.dart';
import '../model/two_d.dart';
import '../utils/constants.dart';
import '../utils/twod_ui.dart';
import '../utils/uis.dart';
import '../widgets/custom_button.dart';

class FourDSelect extends StatefulWidget {
  const FourDSelect({super.key});
  static const String routeName = '/fourd_select';

  @override
  State<FourDSelect> createState() => _FourDSelectState();
}

class _FourDSelectState extends State<FourDSelect> {
  String? title;
  TextEditingController _amountController = TextEditingController(text: '100');
  // List<List<List<TwoD>>> fourDAllList = getFourDAllList();
  int _secondIndex = 0;
  int _thirdIndex = 0;
  List<BetType> betNumList = [];
  String lagerId = '';
  List<Bets> bets = [];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    title = args['title'];
    lagerId = args['lagerId'];
    bets = args['bets'];
    fourDAllList.forEach((fourDAll) {
      fourDAll.forEach((fourD) {
        fourD.forEach((four) {
          bets.forEach((bet) {
            if (four.number == bet.num) {
              four.percent = ((bet.amount / bet.limit) * 100).toInt();
            }
          });
        });
      });
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            fourDAllList.forEach((fourd) {
              fourd.forEach((four) {
                four.forEach((element) {
                  element.choosen = false;
                  setState(() {});
                });
              });
            });
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: PRIMARY_COLOR,
        title: text(
          text: title,
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
        child: Column(children: [
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
                        text: (i * 1000).toString().padLeft(4, '0'),
                        family: 'Fira',
                      ),
                      onPressed: () {
                        v();
                        setState(() {
                          _secondIndex = i;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _secondIndex == i ? ACCENT_2 : SECONDARY_COLOR,
                      ),
                    ),
                  ),
                );
              },
              itemCount: fourDAllList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.white12,
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
                          _thirdIndex = i;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _thirdIndex == i ? ACCENT_2 : SECONDARY_COLOR,
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
                crossAxisCount: 6,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: ((context, index) => Center(
                    child: fourDUi(
                      twoD: fourDAllList[_secondIndex][_thirdIndex][index],
                      cb: () {
                        v();
                        fourDAllList[_secondIndex][_thirdIndex][index].choosen =
                            !fourDAllList[_secondIndex][_thirdIndex][index]
                                .choosen;
                        setState(() {});
                      },
                    ),
                  )),
              itemCount: fourDAllList[_secondIndex][_thirdIndex].length,
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
                _htoeMl(context);
              },
            ),
          ),
        ]),
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

    fourDAllList.forEach((fourd) => {
          fourd.forEach((four) {
            four.forEach((element) {
              element.stake = int.parse(_amountController.value.text);
            });
          })
        });

    fourDAllList.forEach((fourd) {
      fourd.forEach((four) {
        four.forEach((element) {
          if (element.choosen) {
            betNumList.add(element);
            // element.choosen = false;
            // setState(() {});
          }
        });
      });
    });

    if (betNumList.isNotEmpty) {
      Navigator.of(context).pushNamed(BetPage.routeName, arguments: {
        'betNumList': betNumList,
        'lagerId': lagerId,
      });
      print(betNumList);
      betNumList = [];
    } else {
      toastFlash(context, 'ထိုးမည့်နံပါတ်ရွေးချယ်ပါ');
    }
  }
}
