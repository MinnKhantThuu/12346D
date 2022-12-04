// ignore_for_file: must_be_immutable

import 'package:app/provider/lager_provider.dart';
import 'package:app/screen/threed_pauksin.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/uis.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/lagers.dart';

class ThreeDHome extends StatelessWidget {
  ThreeDHome({Key? key}) : super(key: key);
  static const String routeName = '/threed';
  List<Lagers> lagers = [];

  @override
  Widget build(BuildContext context) {
    lagers = context.watch<LagerProvider>().threeDLager;
    return Scaffold(
      appBar: appbar('3D'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  _getThreeDLagers(context),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: CustomButton(
                  title: 'ပေါက်စဉ်',
                  color: ACCENT_1,
                  cb: () {
                    v();
                    Navigator.of(context).pushNamed(ThreeDPaukSin.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _getLagers(BuildContext context) {
  //   String token = Provider.of<AuthProvider>(context, listen: false).user.token;
  //   Provider.of<ThreeDLagerProvider>(context).getThreeDLagers(token: token);
  //   List<Lagers> lagers = Provider.of<ThreeDLagerProvider>(context).lagers;
  //   return lagers;
  // }

  Widget _getThreeDLagers(BuildContext context) {
    if (lagers.isEmpty) {
      return Center(
          child: text(
        text: 'ယနေ့အတွက် 3D ပွဲစဉ်မရှိပါ',
        family: 'Myanmar',
        weight: FontWeight.bold,
        size: 26,
      ));
    }
    if (lagers.isNotEmpty) {
      return Column(
        children: lagers.map((lager) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: CustomButton(
              title: lager.name,
              color: lager.isOpen ? SECONDARY_COLOR : ACCENT_4,
              cb: () async {
                v();
                threeD.forEach((element) {
                  if (lager.name.toString() == element.type.toString()) {
                    Navigator.of(context).pushNamed(element.route, arguments: {
                      "title": element.name,
                      "lagerId": lager.id,
                      "bets": lager.bets,
                    });
                  }
                  if (lager.name.toString() == 'Malaysia_3D') {
                    bottomSheet(context);
                  }
                });
              },
            ),
          );
        }).toList(),
      );
    }
    return text(text: 'Under Processing...');
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: PRIMARY_COLOR,
            ),
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: threeDMalaysia.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    v();
                    // List<Lagers> lagers = _getLagers(context);
                    lagers.forEach((lager) {
                      if (threeDMalaysia[i].type.toString() ==
                          lager.name.toString()) {
                        Navigator.of(context)
                            .pushNamed(threeDMalaysia[i].route, arguments: {
                          "title": threeDMalaysia[i].name,
                          "lagerId": lager.id,
                          "bets": lager.bets,
                        });
                      }
                    });
                    // Navigator.of(context)
                    //     .pushNamed(threeDMalaysia[i].route, arguments: {
                    //   'title': threeDMalaysia[i].name,
                    //   'lagerId': '',
                    // });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: SECONDARY_COLOR,
                    ),
                    child: Center(
                      child: text(
                        text: threeDMalaysia[i].name,
                        weight: FontWeight.bold,
                        size: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
