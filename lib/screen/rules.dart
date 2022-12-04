import 'package:app/provider/rule_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/rule.dart';
import '../utils/uis.dart';

class Rules extends StatelessWidget {
  Rules({super.key});
  static const String routeName = '/rules';
  List<Rule> rules = [];

  @override
  Widget build(BuildContext context) {
    rules = context.watch<RuleProvider>().rules;
    return Scaffold(
      appBar: appbar('စည်းကမ်းချက်များ'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: gradient()),
        child: _getRules(),
      ),
    );
  }

  Widget _getRules() {
    if (rules.isEmpty) {
      return Center(
        child: text(
          text: 'စည်းကမ်းသတ်မှတ်ချက်များအားမတွေ့ပါ',
          size: 16,
          weight: FontWeight.bold,
          family: 'Myanmar',
        ),
      );
    }
    if (rules.isNotEmpty) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: rules.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title:
                        text(text: "${rules[index].title}", family: "Burmese"),
                    children: [_buildRuleCard("${rules[index].desc}")],
                  );
                }),
          )
        ],
      );
    }
    return text(text: 'တစ်ခုခုမှားယွင်းနေပါသည်');
  }

  Container _buildRuleCard(text) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(text,
            textAlign: TextAlign.justify,
            style: TextStyle(fontFamily: "Burmese")),
      )),
    );
  }
}
