import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/slip_provider.dart';
import 'package:app/screen/slips.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/slip.dart';
import '../utils/uis.dart';

class Vouncher extends StatefulWidget {
  Vouncher({super.key});
  static const String routeName = '/vouncher';

  @override
  State<Vouncher> createState() => _VouncherState();
}

class _VouncherState extends State<Vouncher> {
  String _startDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String _endDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  List<Slip> slips = [];

  // _fetchVouncher() async {
  //   String token = Provider.of<AuthProvider>(context).user.token;
  //   await Provider.of<SlipProvider>(context)
  //       .getSlips(token: token, startDate: _startDate, endDate: _endDate);
  //   slips = context.read<SlipProvider>().slips;
  // }

  @override
  Widget build(BuildContext context) {
    slips = context.read<SlipProvider>().slips;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text(
          VOUNCHER,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Myanmar',
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: ACCENT_1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          text(
                            text: _startDate.toString().split(' ')[0],
                            family: 'Fira',
                            size: 14,
                          ),
                          IconButton(
                            onPressed: () {
                              v();
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2222),
                              ).then((date) {
                                _startDate =
                                    DateFormat('dd-MM-yyyy').format(date!);
                                setState(() {});
                              });
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: ACCENT_1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          text(
                            text: _endDate.toString().split(' ')[0],
                            family: 'Fira',
                            size: 14,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              v();
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2222),
                              ).then(
                                (date) {
                                  _endDate =
                                      DateFormat('dd-MM-yyyy').format(date!);
                                  setState(() {});
                                },
                              );
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ACCENT_1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          v();
                          String token =
                              Provider.of<AuthProvider>(context, listen: false)
                                  .user
                                  .token;
                          await Provider.of<SlipProvider>(context,
                                  listen: false)
                              .getSlips(
                            token: token,
                            startDate: _startDate,
                            endDate: _endDate,
                          );
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _getVouncher(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getVouncher() {
    print(slips);
    if (slips.isEmpty) {
      return Center(
        child: text(
          text: 'ယနေ့အတွက်ဘောက်ချာများမရှိပါ',
          family: 'Myanmar',
        ),
      );
    }
    if (slips.isNotEmpty) {
      return Padding(
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
              r2: 'အမျိုးအစား',
              r3: 'စုစုပေါင်း',
              r4: text(
                text: 'အသေးစိတ်',
                family: 'Myanmar',
                weight: FontWeight.bold,
                color: ACCENT_3,
              ),
              fcolor: ACCENT_3,
              fweight: FontWeight.bold,
            ),
            ...slips.map((slip) {
              return tableRow(
                r1: (slips.indexOf(slip) + 1).toString(),
                r2: slip.type,
                r3: slip.total.toString(),
                r4: IconButton(
                  onPressed: () {
                    v();
                    Navigator.of(context)
                        .pushNamed(Slips.routeName, arguments: {
                      'bets': slip.bets,
                    });
                  },
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      );
    }
    return Center(
      child: text(text: 'တစ်ခုခုမှားယွင်းနေပါသည် ထပ်မံကြိုးစားပါ'),
    );
  }
}
