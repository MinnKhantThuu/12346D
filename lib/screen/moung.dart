import 'package:app/screen/guess_win_amount.dart';
import 'package:app/utils/uis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../model/ballone.dart';
import '../provider/ballone_provider.dart';
import '../utils/ball_ui.dart';
import '../utils/constants.dart';
import '../widgets/custom_button.dart';

class Moung extends StatefulWidget {
  Moung({Key? key}) : super(key: key);

  @override
  State<Moung> createState() => _MoungState();
}

class _MoungState extends State<Moung> {
  List<Ballone> moung = [];

  List uniqueLeagueIdList = [];
  List<List<Ballone>> teamList = [];
  List leagueTeam = [];
  List<Ballone> moungMatchList = [];
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    moung = context.watch<BalloneProvider>().moung;
    teamList = context.watch<BalloneProvider>().mgTeamList;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: _getMoung(context),
      ),
    );
  }

  Widget _getMoung(BuildContext context) {
    if (moung.isEmpty) {
      return Center(
        child: text(
          text: 'ယနေ့အတွက်ပွဲစဉ်မရှိပါ',
          family: 'Myanmar',
          size: 26,
          weight: FontWeight.bold,
        ),
      );
    }
    if (moung.isNotEmpty) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) => moungLeague(
                leagueList: teamList[i],
                homeCb: (String sId) {
                  _selectMoungHomeMatch(sId);
                },
                awayCb: (String sId) {
                  _selectMoungAwayMatch(sId);
                },
                overCb: (String sId) {
                  _selectMoungOverMatch(sId);
                },
                underCb: (String sId) {
                  _selectMoungUnderMatch(sId);
                },
              ),
              itemCount: teamList.length,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Expanded(
                      child: appbarTextField(controller: _amountController)),
                  Expanded(
                    child: CustomButton(
                      title: 'တင်မည်',
                      color: PRIMARY_COLOR,
                      cb: () => _tinMal(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Center(
      child: text(
        text: 'တစ်စုံတစ်ခုမှားယွင်းနေပါသည် တဖန်ပြန်လည်ကြိုးစားကြည့်ပါ',
        family: 'Myanmar',
        size: 26,
        weight: FontWeight.bold,
      ),
    );
  }

  _tinMal() async {
    moung.forEach((mg) {
      if (mg.homeSelected ||
          mg.awaySelected ||
          mg.overSelected ||
          mg.underSelected) {
        moungMatchList.add(mg);
      }
    });
    if (moungMatchList.length > 1) {
      if (int.parse(_amountController.value.text) >= 100) {
        Navigator.of(context).pushNamed(GuessWinAmount.routeName, arguments: {
          'matchList': moungMatchList,
          'type': 'moung',
          'amount': double.parse(_amountController.value.text),
        });
      } else {
        toastFlash(context, 'အနဲဆုံး ၁၀၀ ထိုးရမည်');
      }

      // String token =
      //     Provider.of<AuthProvider>(context, listen: false).user.token;
      // var json = jsonEncode({
      //   "type": "BODY",
      //   "bet": moungMatchIdList,
      // });
      // Object resObj =
      //     await Api.post(url: '/bet/blone', json: json, token: token);
      // if (resObj is Success) {
      //   showDialog(
      //     barrierDismissible: false,
      //     context: context,
      //     builder: (BuildContext context) {
      //       return WillPopScope(
      //         onWillPop: () => Future.value(false),
      //         child: AlertDialog(
      //           backgroundColor: Color(0xff3D4085),
      //           title: Center(
      //             child: text(
      //               text: 'အောင်မြင်ပါသည်',
      //               family: 'Myanmar',
      //               weight: FontWeight.bold,
      //               size: 26,
      //             ),
      //           ),
      //           actions: [
      //             TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).pushNamedAndRemoveUntil(
      //                     Home.routeName, (route) => false);
      //                 // Navigator.of(context).pushNamedAndRemoveUntil(
      //                 //     Slips.routeName, ModalRoute.withName(Home.routeName));
      //               },
      //               child: text(text: 'OK'),
      //             )
      //           ],
      //         ),
      //       );
      //     },
      //   );
      // }
    } else {
      toastFlash(context, 'အသင်းအားရွေးချယ်ပါ');
    }
    // moung.forEach((bdy) {
    //   bdy.homeSelected = false;
    //   bdy.awaySelected = false;
    //   bdy.overSelected = false;
    //   bdy.underSelected = false;
    // });
    moungMatchList = [];
    setState(() {});
  }

  _selectMoungHomeMatch(String sId) {
    moung.forEachIndexed((index, element) {
      if (moung[index].id == sId) {
        if (moung[index].homeSelected == true) {
          moung[index].homeSelected = false;
          moung[index].awaySelected = false;
          moung[index].overSelected = false;
          moung[index].underSelected = false;
        } else {
          moung[index].homeSelected = true;
          moung[index].awaySelected = false;
          moung[index].overSelected = false;
          moung[index].underSelected = false;
        }
      }
    });
    setState(() {});
  }

  _selectMoungAwayMatch(String sId) {
    moung.forEachIndexed((index, element) {
      if (moung[index].id == sId) {
        if (moung[index].awaySelected == true) {
          moung[index].homeSelected = false;
          moung[index].awaySelected = false;
          moung[index].overSelected = false;
          moung[index].underSelected = false;
        } else {
          moung[index].homeSelected = false;
          moung[index].awaySelected = true;
          moung[index].overSelected = false;
          moung[index].underSelected = false;
        }
      }
    });
    setState(() {});
  }

  _selectMoungOverMatch(String sId) {
    moung.forEachIndexed((index, element) {
      if (moung[index].id == sId) {
        if (moung[index].overSelected == true) {
          moung[index].homeSelected = false;
          moung[index].awaySelected = false;
          moung[index].overSelected = false;
          moung[index].underSelected = false;
        } else {
          moung[index].homeSelected = false;
          moung[index].awaySelected = false;
          moung[index].overSelected = true;
          moung[index].underSelected = false;
        }
      }
    });
    setState(() {});
  }

  _selectMoungUnderMatch(String sId) {
    moung.forEachIndexed((index, element) {
      if (moung[index].id == sId) {
        if (moung[index].underSelected == true) {
          moung[index].homeSelected = false;
          moung[index].awaySelected = false;
          moung[index].overSelected = false;
          moung[index].underSelected = false;
        } else {
          moung[index].homeSelected = false;
          moung[index].awaySelected = false;
          moung[index].overSelected = false;
          moung[index].underSelected = true;
        }
      }
    });
    setState(() {});
  }
}
