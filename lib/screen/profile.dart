import 'package:app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/uis.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('ပရိုဖိုင်'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: gradient()),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            CircleAvatar(
              minRadius: 60,
              maxRadius: 60,
              backgroundImage: AssetImage(
                'assets/images/person.jpeg',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            text(
              text: context.watch<AuthProvider>().user.name,
              family: 'Myanmar',
              weight: FontWeight.bold,
              size: 26,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: text(
                      text: 'နာမည်',
                      weight: FontWeight.bold,
                      size: 18,
                      family: 'Myanmar'),
                ),
                SizedBox(
                  width: 150,
                ),
                Row(
                  children: [
                    text(
                        text: context.watch<AuthProvider>().user.name,
                        weight: FontWeight.bold,
                        size: 18,
                        family: 'Myanmar'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: text(
                      text: 'လက်ကျန်ငွေ',
                      weight: FontWeight.bold,
                      size: 18,
                      family: 'Myanmar'),
                ),
                SizedBox(
                  width: 150,
                ),
                Row(
                  children: [
                    text(
                        text:
                            context.watch<AuthProvider>().user.money.toString(),
                        weight: FontWeight.bold,
                        size: 18,
                        family: 'Myanmar'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white30,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   width: 20,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: text(
                      text: 'ဓာတ်ပုံ',
                      weight: FontWeight.bold,
                      size: 18,
                      family: 'Myanmar'),
                ),
                // SizedBox(
                //   width: 150,
                // ),
                Row(
                  children: [
                    text(
                        text: 'ပြောင်းရန်',
                        weight: FontWeight.bold,
                        size: 18,
                        family: 'Myanmar'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
