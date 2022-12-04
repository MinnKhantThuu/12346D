// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:app/model/two_d.dart';
import 'package:app/screen/home.dart';
import 'package:app/screen/slips.dart';
import 'package:app/utils/api.dart';
import 'package:app/utils/api_status.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/slip.dart';
import '../provider/auth_provider.dart';
import '../provider/lager_provider.dart';
import '../provider/slip_provider.dart';
import '../utils/uis.dart';

class ConfirmPage extends StatelessWidget {
  static const String routeName = '/twod_confirm';
  final int mainBalance = 200000;
  int totalAmount = 0;
  String betNum = '';
  List betList = [];
  List<BetType> bets = [];
  String? success, failure, lagerId;
  String _startDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String _endDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  List<Slip> slips = [];
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bets = args['bets'];
    totalAmount = args['totalAmount'];
    betNum = args['betNum'];
    lagerId = args['lagerId'];
    return Scaffold(
      appBar: appbar('အတည်ပြုသည်'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            text(
              text: 'ထိုးထားသောနံပါတ်များ',
              family: 'Myanmar',
              weight: FontWeight.bold,
              size: 20,
              color: ACCENT_2,
            ),
            SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: MediaQuery.of(context).size.width - 40,
              ),
              child: Center(
                child: Text(
                  betNum,
                  style: TextStyle(
                    fontFamily: 'Fira',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ACCENT_3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  text: 'ထိုးငွေစုစုပေါင်း',
                  family: 'Myanmar',
                ),
                SizedBox(
                  width: 20,
                ),
                text(
                  text: totalAmount.toString(),
                  family: 'Fira',
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  text: 'မထိုးခင်ကျန်ငွေ',
                  family: 'Myanmar',
                ),
                SizedBox(
                  width: 20,
                ),
                text(
                  text: mainBalance.toString(),
                  family: 'Fira',
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  text: 'ထိုးပြီးကျန်ငွေ',
                  family: 'Myanmar',
                ),
                SizedBox(
                  width: 20,
                ),
                text(
                  text: (mainBalance - totalAmount).toString(),
                  family: 'Fira',
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: CustomButton(
                  title: 'တင်မည်',
                  color: SECONDARY_COLOR,
                  cb: () async {
                    await tinMal(context, bets, lagerId);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> tinMal(
      BuildContext context, List<BetType> twods, String? lagerId) async {
    v();
    String token = Provider.of<AuthProvider>(context, listen: false).user.token;

    bets.forEach((twod) {
      Map betMap = {};
      betMap['num'] = twod.number;
      betMap['amount'] = twod.stake;
      betList.add(betMap);
    });
    threeDAllList.forEach((threeD) {
      threeD.forEach((element) {
        element.choosen = false;
      });
    });
    fourDAllList.forEach((fourd) {
      fourd.forEach((four) {
        four.forEach((element) {
          element.choosen = false;
        });
      });
    });
    var jsonBet = jsonEncode({
      "lagerId": lagerId,
      "bets": betList,
    });
    // var token = Provider.of<AuthProvider>(context, listen: false).user.token;
    Object resObj =
        await Api.post(url: '/bet/two', json: jsonBet, token: token);
    if (resObj is Success) {
      await Provider.of<LagerProvider>(context, listen: false)
          .getAllLagers(token: token);
      await Provider.of<SlipProvider>(context, listen: false)
          .getSlips(token: token, startDate: _startDate, endDate: _endDate);
      slips = Provider.of<SlipProvider>(context, listen: false).slips;
      List lisy = resObj.response as List;
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
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     Vouncher.routeName,
                    //     ModalRoute.withName(Home.routeName));
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Slips.routeName,
                      ModalRoute.withName(Home.routeName),
                      arguments: {
                        'bets': slips.last.bets,
                      },
                    );
                    // print(slips.last.bets);
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
  }
}
