import 'package:app/provider/ballone_provider.dart';
import 'package:app/provider/bank_provider.dart';
import 'package:app/provider/lager_provider.dart';
import 'package:app/provider/quest_provider.dart';
import 'package:app/provider/rule_provider.dart';
import 'package:app/provider/setting_provider.dart';
import 'package:app/provider/slide_provider.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/slip_provider.dart';
import 'package:provider/provider.dart';

import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'helpers/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<SlideProvider>(create: (_) => SlideProvider()),
        ChangeNotifierProvider<SettingProvider>(
            create: (_) => SettingProvider()),
        ChangeNotifierProvider<BankProvider>(create: (_) => BankProvider()),
        ChangeNotifierProvider<QuestProvider>(create: (_) => QuestProvider()),
        ChangeNotifierProvider<RuleProvider>(create: (_) => RuleProvider()),
        ChangeNotifierProvider<SlipProvider>(create: (_) => SlipProvider()),
        ChangeNotifierProvider<BalloneProvider>(
            create: (_) => BalloneProvider()),
        ChangeNotifierProvider<LagerProvider>(create: (_) => LagerProvider()),
      ],
      child: const MyApp(),
    ),
    // const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: routes,
    );
  }
}
