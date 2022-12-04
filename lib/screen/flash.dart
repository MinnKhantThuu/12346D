import 'package:app/provider/bank_provider.dart';
import 'package:app/provider/quest_provider.dart';
import 'package:app/provider/rule_provider.dart';
import 'package:app/provider/setting_provider.dart';
import 'package:app/provider/slide_provider.dart';
import 'package:app/screen/force_download.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/uis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Flash extends StatefulWidget {
  const Flash({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  _loadNextPage() async {
    await context.read<SlideProvider>().getSlide();
    await context.read<BankProvider>().getBanks();
    await context.read<QuestProvider>().getQuests();
    await context.read<RuleProvider>().getRules();
    await context.read<SettingProvider>().getSetting();
    if (Provider.of<SettingProvider>(context, listen: false)
            .setting
            .appVersion ==
        APP_VERSION) {
      Navigator.of(context).pushReplacement(createRoute());
    } else {
      Navigator.of(context).pushReplacementNamed(ForceDownload.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: gradient()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text(
                text: APP_NAME,
                size: 60,
                color: Colors.white,
              ),
              Image.asset('assets/images/logo.png'),
              loadingIndicator,
              text(
                text: LOADING_SARTAR,
                family: 'Myanmar',
                size: 16,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
