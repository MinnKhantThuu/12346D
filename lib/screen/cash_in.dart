import 'package:app/utils/constants.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';

import '../utils/uis.dart';

class CashIn extends StatefulWidget {
  CashIn({super.key});

  static const String routeName = '/cash_in';

  @override
  State<CashIn> createState() => _CashInState();
}

class _CashInState extends State<CashIn> {
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
      appBar: appbar('ငွေသွင်းမည်'),
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
              text(text: 'phone 09500500500'),
              Form(
                  key: _form,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextInput(
                          controller: _tId,
                          icon: Icons.list,
                          hintText: 'လုပ်ငန်းစဉ်အမှတ်ဖြည့်ပါ',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: TextInput(
                          controller: _amount,
                          icon: Icons.money_rounded,
                          hintText: 'ဖြည့်လိုသောငွေပမာဏ',
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
                              title: 'ဖြည့်မယ်',
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
