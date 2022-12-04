import 'package:app/screen/cash_in.dart';
import 'package:app/screen/cash_out.dart';
import 'package:app/screen/force_download.dart';
import 'package:app/screen/guess_win_amount.dart';
import 'package:app/screen/password_change.dart';
import 'package:app/screen/profile.dart';
import 'package:app/screen/questions.dart';
import 'package:app/screen/rules.dart';
import 'package:app/screen/thai_lottery.dart';
import 'package:app/screen/vouncher.dart';
import 'package:flutter/material.dart';

import '../screen/ballone_screen.dart';
import '../screen/flash.dart';
import '../screen/fourd_home.dart';
import '../screen/fourd_pauksin.dart';
import '../screen/fourd_select.dart';
import '../screen/home.dart';
import '../screen/login.dart';
import '../screen/register.dart';
import '../screen/slips.dart';
import '../screen/threed_home.dart';
import '../screen/threed_pauksin.dart';
import '../screen/threed_select.dart';
import '../screen/bet_page.dart';
import '../screen/confirm_page.dart';
import '../screen/twod_home.dart';
import '../screen/twod_pauksin.dart';
import '../screen/twod_select.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Flash.routeName: (_) => const Flash(),
  Login.routeName: (_) => Login(),
  Register.routeName: (_) => Register(),
  Home.routeName: (_) => Home(),
  TwoDHome.routeName: (_) => TwoDHome(),
  ThreeDHome.routeName: (_) => ThreeDHome(),
  TwoDPaukSin.routeName: (_) => const TwoDPaukSin(),
  ThreeDPaukSin.routeName: (_) => const ThreeDPaukSin(),
  BalloneScreen.routeName: (_) => BalloneScreen(),
  TwoDSelect.routeName: (_) => TwoDSelect(),
  BetPage.routeName: (_) => const BetPage(),
  ConfirmPage.routeName: (_) => ConfirmPage(),
  ThreeDSelect.routeName: (_) => ThreeDSelect(),
  Slips.routeName: (_) => Slips(),
  FourD.routeName: (_) => FourD(),
  FourDPaukSin.routeName: (_) => FourDPaukSin(),
  FourDSelect.routeName: (_) => FourDSelect(),
  ThaiLottery.routeName: (_) => ThaiLottery(),
  ForceDownload.routeName: (_) => ForceDownload(),
  Vouncher.routeName: (_) => Vouncher(),
  GuessWinAmount.routeName: (_) => GuessWinAmount(),
  CashIn.routeName: (_) => CashIn(),
  CashOut.routeName: (_) => CashOut(),
  Rules.routeName: (_) => Rules(),
  Question.routeName: (_) => Question(),
  Profile.routeName: (_) => Profile(),
  PasswordChange.routeName: (_) => PasswordChange(),
  // '/': (_) => GuessWinAmount(),
};
