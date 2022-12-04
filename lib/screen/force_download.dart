import 'package:app/utils/constants.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/uis.dart';

class ForceDownload extends StatelessWidget {
  const ForceDownload({super.key});
  static const String routeName = '/force_download';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(
              text: 'APPLICATION VERSION',
              family: 'Fira',
              weight: FontWeight.bold,
              size: 24,
              color: ACCENT_3,
            ),
            const SizedBox(
              height: 5,
            ),
            text(
              text: DOWNLOAD,
              family: 'Myanmar',
              weight: FontWeight.bold,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                CustomButton(
                  height: 50,
                  width: 150,
                  title: 'ထွက်မယ်',
                  fsize: 18,
                  color: ACCENT_2,
                  cb: () {
                    v();
                    SystemNavigator.pop();
                  },
                ),
                CustomButton(
                  height: 50,
                  width: 150,
                  title: 'ဒေါင်းမယ်',
                  fsize: 18,
                  color: ACCENT_3,
                  cb: () {
                    v();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
