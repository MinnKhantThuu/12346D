import 'package:app/provider/ballone_provider.dart';
import 'package:app/screen/guess_win_amount.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/uis.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ballone.dart';
import '../utils/ball_ui.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Ballone> body = [];
  List leagueId = [];
  List<List<Ballone>> teamList = [];
  List bodyLeagueList = [];
  Map bodyMatchId = {};
  List<Ballone> bodyMatchList = [];
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    body = context.watch<BalloneProvider>().body;
    teamList = context.watch<BalloneProvider>().bTeamList;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    if (body.isEmpty) {
      return Center(
        child: text(
          text: 'ယနေ့အတွက်ပွဲစဉ်မရှိပါ',
          family: 'Myanmar',
          size: 26,
          weight: FontWeight.bold,
        ),
      );
    }
    if (body.isNotEmpty) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) => bodyLeague(
                leagueList: teamList[i],
                homeCb: (String sId) {
                  _selectBodyHomeMatch(sId);
                },
                awayCb: (String sId) {
                  _selectBodyAwayMatch(sId);
                },
                overCb: (String sId) {
                  _selectBodyOverMatch(sId);
                },
                underCb: (String sId) {
                  _selectBodyUnderMatch(sId);
                },
              ),
              itemCount: teamList.length,
            ),
          ),
          // if (bodyMatchId.isNotEmpty)
          if (bodyMatchList.isNotEmpty)
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
    v();
    // String token = context.watch<AuthProvider>().user.token;
    // String token = Provider.of<AuthProvider>(context, listen: false).user.token;
    // var json = jsonEncode({
    //   "type": "BODY",
    //   "bet": bodyMatchId,
    // });
    // Object resObj = await Api.post(url: '/bet/blone', json: json, token: token);
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
    if (int.parse(_amountController.value.text) >= 100) {
      Navigator.of(context).pushNamed(GuessWinAmount.routeName, arguments: {
        'matchList': bodyMatchList,
        'type': 'body',
        'amount': double.parse(_amountController.value.text),
      });
      bodyMatchList = [];
    } else {
      toastFlash(context, 'အနဲဆုံး ၁၀၀ ထိုးရမည်');
    }

    // body.forEach((bdy) {
    //   bdy.homeSelected = false;
    //   bdy.awaySelected = false;
    //   bdy.overSelected = false;
    //   bdy.underSelected = false;
    // });
  }

  _selectBodyHomeMatch(String sId) {
    body.forEachIndexed((index, element) {
      if (body[index].id == sId) {
        if (body[index].homeSelected == true) {
          // bodyMatchId.clear();
          bodyMatchList = [];
          body[index].homeSelected = false;
          body[index].awaySelected = false;
          body[index].overSelected = false;
          body[index].underSelected = false;
        } else {
          // bodyMatchId['matchId'] = body[index].matchId;
          bodyMatchList.add(body[index]);
          body[index].homeSelected = true;
          body[index].awaySelected = false;
          body[index].overSelected = false;
          body[index].underSelected = false;
        }
      } else {
        body[index].homeSelected = false;
        body[index].awaySelected = false;
        body[index].overSelected = false;
        body[index].underSelected = false;
      }
    });
    // print(bodyMatchId);
    setState(() {});
  }

  _selectBodyAwayMatch(String sId) {
    body.forEachIndexed((index, element) {
      if (body[index].id == sId) {
        if (body[index].awaySelected == true) {
          // bodyMatchId.clear();
          bodyMatchList = [];
          body[index].homeSelected = false;
          body[index].awaySelected = false;
          body[index].overSelected = false;
          body[index].underSelected = false;
        } else {
          // bodyMatchId['matchId'] = body[index].matchId;
          bodyMatchList.add(body[index]);
          body[index].homeSelected = false;
          body[index].awaySelected = true;
          body[index].overSelected = false;
          body[index].underSelected = false;
        }
      } else {
        body[index].homeSelected = false;
        body[index].awaySelected = false;
        body[index].overSelected = false;
        body[index].underSelected = false;
      }
    });
    setState(() {});
  }

  _selectBodyOverMatch(String sId) {
    body.forEachIndexed((index, element) {
      if (body[index].id == sId) {
        if (body[index].overSelected == true) {
          // bodyMatchId.clear();
          bodyMatchList = [];
          body[index].homeSelected = false;
          body[index].awaySelected = false;
          body[index].overSelected = false;
          body[index].underSelected = false;
        } else {
          // bodyMatchId['matchId'] = body[index].matchId;
          bodyMatchList.add(body[index]);
          body[index].homeSelected = false;
          body[index].awaySelected = false;
          body[index].overSelected = true;
          body[index].underSelected = false;
        }
      } else {
        body[index].homeSelected = false;
        body[index].awaySelected = false;
        body[index].overSelected = false;
        body[index].underSelected = false;
      }
    });
    setState(() {});
  }

  _selectBodyUnderMatch(String sId) {
    body.forEachIndexed((index, element) {
      if (body[index].id == sId) {
        if (body[index].underSelected == true) {
          // bodyMatchId.clear();
          bodyMatchList = [];
          body[index].homeSelected = false;
          body[index].awaySelected = false;
          body[index].overSelected = false;
          body[index].underSelected = false;
        } else {
          // bodyMatchId['matchId'] = body[index].matchId;
          bodyMatchList.add(body[index]);
          body[index].homeSelected = false;
          body[index].awaySelected = false;
          body[index].overSelected = false;
          body[index].underSelected = true;
        }
      } else {
        body[index].homeSelected = false;
        body[index].awaySelected = false;
        body[index].overSelected = false;
        body[index].underSelected = false;
      }
    });
    setState(() {});
  }
}
