// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/lagers.dart';
import '../provider/lager_provider.dart';
import '../utils/constants.dart';
import '../utils/uis.dart';
import '../widgets/custom_button.dart';
import 'fourd_pauksin.dart';

class FourD extends StatelessWidget {
  FourD({super.key});
  static const String routeName = '/fourd';
  List<Lagers> lagers = [];

  @override
  Widget build(BuildContext context) {
    lagers = context.watch<LagerProvider>().fourDLager;
    return Scaffold(
      appBar: appbar('4D'),
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
                  _getFourDLagers(context),
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
                    Navigator.of(context).pushNamed(FourDPaukSin.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getFourDLagers(BuildContext context) {
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
                fourD.forEach((four) {
                  if (lager.name.toString() == four.type.toString()) {
                    Navigator.of(context).pushNamed(four.route, arguments: {
                      "title": four.name,
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
                    Navigator.of(context)
                        .pushNamed(fourDMalaysia[i].route, arguments: {
                      'title': threeDMalaysia[i].name,
                      'lagerId': '',
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: SECONDARY_COLOR,
                    ),
                    child: Center(
                      child: text(
                        text: fourDMalaysia[i].name,
                        weight: FontWeight.bold,
                        size: 18,
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
