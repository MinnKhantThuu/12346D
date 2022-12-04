import 'package:app/model/lagers.dart';
import 'package:app/provider/lager_provider.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/uis.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwoDHome extends StatefulWidget {
  TwoDHome({Key? key}) : super(key: key);
  static const String routeName = '/twod';

  @override
  State<TwoDHome> createState() => _TwoDHomeState();
}

class _TwoDHomeState extends State<TwoDHome> {
  List<Lagers> lagers = [];

  @override
  Widget build(BuildContext context) {
    lagers = Provider.of<LagerProvider>(context).twoDLager;
    // lagers = context.watch<LagerProvider>().twoDLager;
    return Scaffold(
      appBar: appbar('2D'),
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    _getTwoDLagers(context),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: CustomButton(
                  height: 60,
                  title: 'ပေါက်စဉ်',
                  color: ACCENT_1,
                  cb: () {
                    v();
                    Navigator.of(context).pushNamed('/twodpauksin');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTwoDLagers(BuildContext context) {
    if (lagers.isEmpty) {
      return Center(
          child: text(
        text: 'ယနေ့အတွက် 2D ပွဲစဉ်မရှိပါ',
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
                twoD.forEach((element) {
                  if (element.type.toString() == lager.name.toString()) {
                    Navigator.of(context).pushNamed(element.route, arguments: {
                      "title": element.name,
                      "lagerId": lager.id,
                      "bets": lager.bets,
                    });
                  }
                  if (lager.name.toString() == 'Malaysia_2D') {
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
            itemCount: twoDMalaysia.length,
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
                  lagers.forEach((lager) {
                    if (twoDMalaysia[i].type.toString() ==
                        lager.name.toString()) {
                      Navigator.of(context)
                          .pushNamed(twoDMalaysia[i].route, arguments: {
                        "title": twoDMalaysia[i].name,
                        "lagerId": lager.id,
                      });
                    }
                  });
                  // Navigator.of(context)
                  //     .pushNamed(twoDMalaysia[i].route, arguments: {
                  //   'title': twoDMalaysia[i].name,
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
                      text: twoDMalaysia[i].name,
                      weight: FontWeight.bold,
                      size: 20,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
