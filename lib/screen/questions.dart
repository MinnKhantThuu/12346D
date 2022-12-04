import 'package:app/model/quest.dart';
import 'package:app/provider/quest_provider.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/uis.dart';

class Question extends StatelessWidget {
  Question({super.key});

  static const String routeName = '/question';
  List<Quest> rules = [];

  @override
  Widget build(BuildContext context) {
    rules = context.watch<QuestProvider>().quests;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text(
          'မေးခွန်းများ',
          style: TextStyle(
            fontFamily: 'Myanmar',
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse('09500500500'),
                    mode: LaunchMode.externalApplication);
              },
              icon: Icon(Icons.phone))
        ],
      ),
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
          text: 'အမေးအဖြေများအားမတွေ့ပါ',
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
                    title: text(
                      text: "${rules[index].question}",
                      family: "Myanmar",
                      weight: FontWeight.bold,
                    ),
                    children: [_buildRuleCard("${rules[index].answer}")],
                  );
                }),
          )
        ],
      );
    }
    return text(
      text: 'တစ်ခုခုမှားယွင်းနေပါသည်',
      weight: FontWeight.bold,
      family: 'Myanmar',
    );
  }

  Container _buildRuleCard(text) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(text,
            textAlign: TextAlign.justify,
            style: TextStyle(fontFamily: "Myanmar")),
      )),
    );
  }
}
