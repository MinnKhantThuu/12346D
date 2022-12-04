import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/uis.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_input_widget.dart';

class CashOut extends StatefulWidget {
  const CashOut({super.key});

  static const String routeName = '/cash_out';

  @override
  State<CashOut> createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  int _pageIndex = 0;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _tId = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  List<String> banks = [
    'assets/images/aya.png',
    'assets/images/cb.png',
    'assets/images/kbz.png',
    'assets/images/yoma.png',
    'assets/images/kbzpay.png',
    'assets/images/wavepay.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('ငွေထုတ်မည်'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: gradient()),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 260,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        v();
                        _pageIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                            width: 10,
                            color: _pageIndex == index
                                ? Colors.green
                                : Colors.transparent,
                          ),
                        ),
                        child: ClipOval(
                            child: Image.asset(
                          banks[index],
                          fit: BoxFit.cover,
                        )),
                      ),
                    );
                  },
                  itemCount: banks.length,
                ),
              ),
              Form(
                  key: _form,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextInput(
                          controller: _tId,
                          icon: Icons.balance,
                          hintText: 'ဘဏ်အကောင့်နံပါတ်',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextInput(
                          controller: _amount,
                          icon: Icons.person,
                          hintText: 'အမည်',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextInput(
                          controller: _amount,
                          icon: Icons.money_rounded,
                          hintText: 'ထုတ်လိုသောငွေပမာဏ',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                              width: 120,
                              height: 50,
                              title: 'ထုတ်မယ်',
                              fsize: 16,
                              color: SECONDARY_COLOR,
                              cb: () {
                                v();
                              })
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
