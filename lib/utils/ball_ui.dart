import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../model/ballone.dart';
import 'uis.dart';

Padding bodyLeague({
  // required String leagueId,
  required List<Ballone> leagueList,
  required Function homeCb,
  required Function awayCb,
  required Function overCb,
  required Function underCb,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 10,
    ),
    child: Column(
      children: [
        leagueTitle(
          leagueId: leagueList[0].leagueId.toString(),
          leagueName: leagueList[0].leagueName,
        ),
        ...leagueList.map((league) {
          return pwalSin(
            goal: '0',
            body: '0.95',
            blone: league,
            homeCb: homeCb,
            awayCb: awayCb,
            overCb: overCb,
            underCb: underCb,
          );
        }).toList(),
      ],
    ),
  );
}

Padding moungLeague({
  required List<Ballone> leagueList,
  required Function homeCb,
  required Function awayCb,
  required Function overCb,
  required Function underCb,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 10,
    ),
    child: Column(
      children: [
        leagueTitle(
          leagueId: leagueList[0].leagueId.toString(),
          leagueName: leagueList[0].leagueName,
        ),
        ...leagueList.map((league) {
          return pwalSin(
            goal: '0',
            body: '0.95',
            blone: league,
            homeCb: homeCb,
            awayCb: awayCb,
            overCb: overCb,
            underCb: underCb,
          );
        }).toList(),
      ],
    ),
  );
}

Container leagueTitle({
  String? leagueId,
  required String leagueName,
}) {
  return Container(
    width: double.infinity,
    height: 35,
    decoration: BoxDecoration(
      color: Color(0xffCE8033),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          offset: Offset(1, 1),
          blurRadius: 5,
        ),
      ],
    ),
    child: Center(
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          if (leagueId != null)
            Image.network(
              IMAGE_URL + 'leagues/$leagueId.png',
              width: 30,
              height: 30,
            ),
          const SizedBox(
            width: 30,
          ),
          text(
            text: leagueName,
            family: 'Myanmar',
            weight: FontWeight.bold,
            size: 16,
          ),
        ],
      ),
    ),
  );
}

Widget pwalSin({
  required String goal,
  required Ballone blone,
  required String body,
  Function? homeCb,
  Function? awayCb,
  Function? overCb,
  Function? underCb,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      // horizontal: 20,
      vertical: 15,
    ),
    margin: EdgeInsets.only(
      bottom: 5,
    ),
    width: double.infinity,
    decoration: BoxDecoration(
      color: ACCENT_4,
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(1, 1),
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      children: [
        text(
          text: blone.matchTime,
          family: 'Fira',
          size: 14,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            goalZa(
              goal: goal.toString(),
            ),
            bodyOrMgZa(
              body: blone.hdpHome.toString(),
            ),
            // Column(
            //   children: [
            //     bodyZa(
            //       body: body.toString(),
            //     ),
            //     const SizedBox(
            //       height: 5,
            //     ),
            //     bodyZa(
            //       body: body.toString(),
            //     ),
            //   ],
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => homeCb!(blone.id),
                  child: blone.homeSelected
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                                color: Colors.red,
                              )),
                          child: Image.network(
                            IMAGE_URL + blone.homeTeamLogo,
                            width: 34,
                            height: 34,
                          ),
                        )
                      : Image.network(
                          IMAGE_URL + blone.homeTeamLogo,
                          width: 34,
                          height: 34,
                        ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 60,
                    minWidth: 60,
                    maxHeight: 25,
                    minHeight: 25,
                  ),
                  child: Center(
                    child: text(
                      text: blone.homeTeamName,
                      family: 'Myanmar',
                    ),
                  ),
                ),
              ],
            ),
            playTime(time: '108'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.network(
                //   IMAGE_URL + blone.awayTeamLogo,
                //   width: 34,
                //   height: 34,
                // ),
                InkWell(
                  onTap: () => awayCb!(blone.id),
                  child: blone.awaySelected
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                                color: Colors.red,
                              )),
                          child: Image.network(
                            IMAGE_URL + blone.awayTeamLogo,
                            width: 34,
                            height: 34,
                          ),
                        )
                      : Image.network(
                          IMAGE_URL + blone.awayTeamLogo,
                          width: 34,
                          height: 34,
                        ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 60,
                    minWidth: 60,
                    maxHeight: 25,
                    minHeight: 25,
                  ),
                  child: Center(
                    child: text(
                      text: blone.awayTeamName,
                      family: 'Myanmar',
                    ),
                  ),
                ),
              ],
            ),
            bodyOrMgZa(
              body: blone.hdpAway.toString(),
            ),
            // Column(
            //   children: [
            //     bodyZa(
            //       body: body.toString(),
            //     ),
            //     const SizedBox(
            //       height: 5,
            //     ),
            //     bodyZa(
            //       body: body.toString(),
            //     ),
            //   ],
            // ),
            goalZa(
              goal: goal.toString(),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: blone.overSelected ? Colors.red : Color(0xff6D6654),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () => overCb!(blone.id),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(
                          text: 'OVER',
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        text(
                          text: blone.ouOver.toString(),
                          family: 'Fira',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  child: Center(
                      child: text(
                    text: 'G(${blone.hdpOddShow})',
                    family: 'Fira',
                    size: 16,
                  )),
                  decoration: BoxDecoration(
                    color: Color(0xff33313C),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  // width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    color: blone.underSelected ? Colors.red : Color(0xff6D6654),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () => underCb!(blone.id),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(
                          text: 'UNDER',
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        text(
                          text: blone.ouUnder.toString(),
                          family: 'Fira',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Container bodyOrMgZa({required String body}) {
  return Container(
    width: 60,
    height: 23,
    decoration: BoxDecoration(
      color: Color(0xff27262D),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: text(
        text: body.toString(),
        family: 'Fira',
        size: 14,
      ),
    ),
  );
}

Container goalZa({required String goal}) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: Color(0xffEDDC8C),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: text(
        text: goal.toString(),
        family: 'Fira',
        color: Colors.black,
      ),
    ),
  );
}

Container playTime({required String time}) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: text(
        text: time.toString(),
        family: 'Fira',
        color: Colors.white,
      ),
    ),
  );
}
