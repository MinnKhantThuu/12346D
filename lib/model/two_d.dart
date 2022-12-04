import 'package:flutter/material.dart';

class BetType {
  Color color;
  int percent, apate, limit, amount, stake;
  String number;
  bool choosen;
  BetType({
    required this.color,
    this.percent: 0,
    required this.amount,
    required this.apate,
    required this.number,
    this.limit: 100000,
    this.stake: 100,
    this.choosen = false,
  });
}
