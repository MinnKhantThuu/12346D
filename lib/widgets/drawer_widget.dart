import 'package:app/provider/setting_provider.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/screen/cash_in.dart';
import 'package:app/screen/cash_out.dart';
import 'package:app/screen/password_change.dart';
import 'package:app/screen/profile.dart';
import 'package:app/screen/questions.dart';
import 'package:app/screen/rules.dart';
import 'package:app/screen/vouncher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../utils/uis.dart';

class UiDrawer extends StatelessWidget {
  UiDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: SECONDARY_COLOR,
      width: (MediaQuery.of(context).size.width / 3) * 2,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: PRIMARY_COLOR,
            child: GestureDetector(
              onTap: () {
                v();
                Navigator.of(context).pushNamed(Profile.routeName);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 45,
                    maxRadius: 45,
                    backgroundImage: AssetImage(
                      'assets/images/person.jpeg',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  text(
                    // text: 'မောင်ပြုံး',
                    text: context.read<AuthProvider>().user.name,
                    family: 'Myanmar',
                    weight: FontWeight.bold,
                  ),
                  text(
                    // text: '2000000',
                    text: context.read<AuthProvider>().user.money.toString(),
                    family: 'Fira',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                uiListTile(
                  preIcon: Icons.wallet,
                  txt: 'ငွေသွင်းမည်',
                  cb: (() async {
                    v();
                    Navigator.of(context).pushNamed(CashIn.routeName);
                  }),
                ),
                Divider(
                  height: 0,
                  indent: 10,
                  endIndent: 10,
                  color: PRIMARY_COLOR,
                ),
                uiListTile(
                  preIcon: Icons.wallet,
                  txt: 'ငွေထုတ်မည်',
                  cb: (() async {
                    v();
                    Navigator.of(context).pushNamed(CashOut.routeName);
                  }),
                ),
                Divider(
                  height: 0,
                  indent: 10,
                  endIndent: 10,
                  color: PRIMARY_COLOR,
                ),
                uiListTile(
                  preIcon: Icons.book,
                  txt: VOUNCHER,
                  cb: () async {
                    v();
                    Navigator.of(context).pushNamed(Vouncher.routeName);
                  },
                ),
                Divider(
                  height: 0,
                  indent: 10,
                  endIndent: 10,
                  color: PRIMARY_COLOR,
                ),
                uiListTile(
                  preIcon: Icons.warning,
                  txt: RULES,
                  cb: () {
                    v();
                    Navigator.of(context).pushNamed(Rules.routeName);
                  },
                ),
                Divider(
                  height: 0,
                  indent: 10,
                  endIndent: 10,
                  color: PRIMARY_COLOR,
                ),
                uiListTile(
                  preIcon: Icons.question_answer,
                  txt: Q_A,
                  cb: () {
                    v();
                    Navigator.of(context).pushNamed(Question.routeName);
                  },
                ),
                Divider(
                  height: 0,
                  indent: 10,
                  endIndent: 10,
                  color: PRIMARY_COLOR,
                ),
                uiListTile(
                  preIcon: Icons.lock,
                  txt: CHG_PW,
                  cb: () {
                    v();
                    Navigator.of(context).pushNamed(PasswordChange.routeName);
                  },
                ),
                Divider(
                  height: 0,
                  indent: 10,
                  endIndent: 10,
                  color: PRIMARY_COLOR,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(
                text: 'version ',
                size: 14,
                family: 'Myanmar',
              ),
              text(
                text: context.watch<SettingProvider>().setting.appVersion,
                size: 14,
                family: 'Myanmar',
              ),
            ],
          ),
          Divider(
            height: 0,
            color: PRIMARY_COLOR,
          ),
          uiListTile(
            preIcon: Icons.logout,
            txt: LOGOUT,
            arrow: false,
            cb: () {
              v();
              Provider.of<AuthProvider>(context, listen: false)
                  .setSuccess(false);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  ListTile uiListTile({
    required IconData preIcon,
    required String txt,
    bool arrow: true,
    required VoidCallback cb,
  }) {
    return ListTile(
      leading: Icon(
        preIcon,
        color: Colors.white,
      ),
      title: text(
        text: txt,
        color: Colors.white,
        family: 'Myanmar',
        weight: FontWeight.bold,
        size: 14,
      ),
      trailing: arrow
          ? Icon(
              Icons.arrow_right_outlined,
              color: Colors.white,
            )
          : null,
      onTap: () => cb(),
    );
  }
}
