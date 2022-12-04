import 'package:app/utils/constants.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';

import '../utils/uis.dart';

class PasswordChange extends StatelessWidget {
  PasswordChange({super.key});
  static const String routeName = '/password_change';
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _prevPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('လျှို့ဝှက်ကုဒ်ပြောင်းမည်'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: gradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text(text: 'ပြောင်းမည့်',),
            Form(
              key: _form,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: TextInput(
                      controller: _prevPassword,
                      icon: Icons.lock,
                      hintText: 'ယခင်ကုဒ်',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: TextInput(
                      controller: _newPassword,
                      icon: Icons.lock,
                      hintText: 'ပြောင်းလဲမည့်ကုဒ်',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5,
                  ),
                  child: CustomButton(
                    width: 100,
                    height: 50,
                    title: 'ပြောင်းမည်',
                    fsize: 18,
                    color: SECONDARY_COLOR,
                    cb: () {
                      v();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
