import 'package:app/model/two_d.dart';
import 'package:app/model/category.dart';
import 'package:app/screen/fourd_select.dart';
import 'package:app/screen/threed_select.dart';
import 'package:app/screen/twod_select.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vibration/vibration.dart';

import '../model/main_category.dart';

const String APP_NAME = 'KING';
const String LOGIN = 'Login';
const String REGISTER = 'Register';
const String LOADING_SARTAR = 'ချိတ်ဆက်နေသည် ခေတ္တစောင့်ဆိုင်းပေးပါ..';
const String REGISTER_NOW = 'Register now';
const String LOGIN_NOW = 'Login here';
const String MARQUEE =
    'ငုံ့လျှက်သာ ကိုယ်စီ ဆုတ်ကာ လွှေးတော့သည်  ပြီးလျှင် ရေမရှာ ခွေးသာ ကျွေးတော့သည်';
const String BALLONE = 'ဘော်လုံး';
const String PL = 'PREMIER LEAGUE';
const String MONEY = 'ငွေသွင်း/ငွေထုတ်မည်';
const String VOUNCHER = 'ဘောက်ချာများ';
const String RULES = 'စည်းကမ်းချက်များ';
const String CHG_PW = 'လျှို့ဝှက်ကုဒ်ပြောင်းမည်';
const String LOGOUT = 'အကောင့်မှထွက်မည်';
const String Q_A = 'မေးလေ့မေးထရှိသောမေးခွန်းများ';
const String CUSTOMER_NAME = 'မစ္စတာပြုံး';
const String APP_VERSION = '1.0.1';
const String APP_ID = 'KO2';
const String DOWNLOAD = 'အသစ်ရရှိပါပြီ ဒေါင်းလုဒ်ရယူပါ..';

const Color PRIMARY_COLOR = Color(0xff171741);
const Color SECONDARY_COLOR = Color(0xff3F41A7);
const Color ACCENT_1 = Color(0xff1C1E50);
const Color ACCENT_2 = Color(0xff399EDD);
const Color ACCENT_3 = Color(0xffF1927A);
const Color ACCENT_4 = Color(0xff33313C);

const String IMAGE_URL = 'http://52.76.40.79:3001/';

ThemeData theme = ThemeData(
  fontFamily: 'Fira',
);

Container loadingIndicator = Container(
  width: 100,
  height: 100,
  child: LoadingIndicator(
    indicatorType: Indicator.ballClipRotateMultiple,
    colors: const [
      Color(0xff740E2C),
    ],
    strokeWidth: 2,
    backgroundColor: Colors.transparent,
    pathBackgroundColor: Colors.black,
  ),
);

Future<void> v() {
  return Vibration.vibrate(duration: 30);
}

List<MainCategory> category = [
  MainCategory(name: '2D', route: '/twod'),
  MainCategory(name: '3D', route: '/threed'),
  MainCategory(name: '4D', route: '/fourd'),
  MainCategory(name: 'ထိုင်းထီ', route: '/thai_lottery'),
  MainCategory(name: 'ဘောလုံး', route: '/ballone'),
  MainCategory(name: 'ဂိမ်း', route: '/game'),
];

List<Category> twoD = [
  Category(
      name: 'စင်္ကာပူ 2D', type: 'Singapore_2D', route: TwoDSelect.routeName),
  Category(
      name: 'ကမ္ဘောဒီးယား 2D',
      type: 'Combodia_2D',
      route: TwoDSelect.routeName),
  Category(name: 'လာအို 2D', type: 'LAO_2D', route: TwoDSelect.routeName),
  Category(
      name: 'မက်နမ် 2D', type: 'MALAY_MAGNUM_2D', route: TwoDSelect.routeName),
  Category(
      name: 'ဆာရာဝက် 2D',
      type: 'MALAY_SARAHWAK_2D',
      route: TwoDSelect.routeName),
  Category(
      name: 'ဒမေခိုင်း 2D',
      type: 'MALAY_DAMACAI_2D',
      route: TwoDSelect.routeName),
  Category(
      name: 'တိုတို 2D', type: 'MALAY_TOTO_2D', route: TwoDSelect.routeName),
  Category(
      name: 'ဆားဘတ်88 2D',
      type: 'MALAY_SABAH88_2D',
      route: TwoDSelect.routeName),
  Category(
      name: 'ဆန်ဒါခံ 2D',
      type: 'MALAY_SANDAKAN_2D',
      route: TwoDSelect.routeName),
  // Category(name: 'မလေးရှား 2D', type: 'Malaysia_2D', route: ''),
];

// ignore: non_constant_identifier_names
List<Category> twoDMalaysia = [
  Category(name: 'Magnum 2D', type: 'Magnum_2D', route: TwoDSelect.routeName),
  Category(name: 'Damacai 2D', type: 'Damacai_2D', route: TwoDSelect.routeName),
  Category(name: 'ToTo 2D', type: 'ToTo_2D', route: TwoDSelect.routeName),
  Category(name: 'Sabah88 2D', type: 'Sabah88_2D', route: TwoDSelect.routeName),
  Category(name: 'Sarawak 2D', type: 'Sarawak_2D', route: TwoDSelect.routeName),
  Category(
      name: 'Sandakan 2D', type: 'Sandakan_2D', route: TwoDSelect.routeName),
];

List<Category> threeD = [
  Category(
      name: 'စင်္ကာပူ 3D', type: 'Singapore_3D', route: ThreeDSelect.routeName),
  Category(
      name: 'ကမ္ဘောဒီးယား 3D',
      type: 'Combodia_3D',
      route: ThreeDSelect.routeName),
  Category(name: 'လာအို 3D', type: 'LAO_3D', route: ThreeDSelect.routeName),
  Category(name: 'ထိုင်း 3D', type: 'THAI_3D', route: ThreeDSelect.routeName),
  Category(
      name: 'မက်နမ် 3D',
      type: 'MALAY_MAGNUM_3D',
      route: ThreeDSelect.routeName),
  Category(
      name: 'ဆာရာဝက် 3D',
      type: 'MALAY_SARAHWAK_3D',
      route: ThreeDSelect.routeName),
  Category(
      name: 'ဒမေခိုင်း 3D',
      type: 'MALAY_DAMACAI_3D',
      route: ThreeDSelect.routeName),
  Category(
      name: 'တိုတို 3D', type: 'MALAY_TOTO_3D', route: ThreeDSelect.routeName),
  Category(
      name: 'ဆားဘတ်88 3D',
      type: 'MALAY_SABAH88_3D',
      route: ThreeDSelect.routeName),
  Category(
      name: 'ဆန်ဒါခံ 3D',
      type: 'MALAY_SANDAKAN_3D',
      route: ThreeDSelect.routeName),
  // Category(name: 'မလေးရှား 3D', type: 'Malaysia_3D', route: ''),
];

List<Category> threeDMalaysia = [
  Category(name: 'Magnum 3D', type: 'Magnum_3D', route: ThreeDSelect.routeName),
  Category(
      name: 'Damacai 3D', type: 'Damacai_3D', route: ThreeDSelect.routeName),
  Category(name: 'ToTo 3D', type: 'ToTo_3D', route: ThreeDSelect.routeName),
  Category(
      name: 'Sabah88 3D', type: 'Sabah88_3D', route: ThreeDSelect.routeName),
  Category(
      name: 'Sarawak 3D', type: 'Sarawak_3D', route: ThreeDSelect.routeName),
  Category(
      name: 'Sandakan 3D', type: 'Sandakan_3D', route: ThreeDSelect.routeName),
];

List<Category> fourD = [
  Category(
      name: 'စင်္ကာပူ 4D', type: 'Singapore_4D', route: FourDSelect.routeName),
  Category(
      name: 'ကမ္ဘောဒီးယား 4D',
      type: 'Combodia_4D',
      route: FourDSelect.routeName),
  Category(name: 'လာအို 4D', type: 'LAO_4D', route: FourDSelect.routeName),
  Category(
      name: 'မက်နမ် 4D', type: 'MALAY_MAGNUM_4D', route: FourDSelect.routeName),
  Category(
      name: 'ဆာရာဝက် 4D',
      type: 'MALAY_SARAHWAK_4D',
      route: FourDSelect.routeName),
  Category(
      name: 'ဒမေခိုင်း 4D',
      type: 'MALAY_DAMACAI_4D',
      route: FourDSelect.routeName),
  Category(
      name: 'တိုတို 4D', type: 'MALAY_TOTO_4D', route: FourDSelect.routeName),
  Category(
      name: 'ဆားဘတ်88 4D',
      type: 'MALAY_SABAH88_4D',
      route: FourDSelect.routeName),
  Category(
      name: 'ဆန်ဒါခံ 4D',
      type: 'MALAY_SANDAKAN_4D',
      route: FourDSelect.routeName),
  // Category(name: 'မလေးရှား 4D', type: 'Malaysia_4D', route: ''),
];

List<Category> fourDMalaysia = [
  Category(name: 'Magnum 4D', type: 'Magnum_4D', route: FourDSelect.routeName),
  Category(
      name: 'Damacai 4D', type: 'Damacai_4D', route: FourDSelect.routeName),
  Category(name: 'ToTo 4D', type: 'ToTo_4D', route: FourDSelect.routeName),
  Category(
      name: 'Sabah88 4D', type: 'Sabah88_4D', route: FourDSelect.routeName),
  Category(
      name: 'Sarawak 4D', type: 'Sarawak_4D', route: FourDSelect.routeName),
  Category(
      name: 'Sandakan 4D', type: 'Sandakan_4D', route: FourDSelect.routeName),
];

List<BetType> getTwod() {
  List<BetType> list = [];
  for (int i = 0; i < 100; i++) {
    BetType t = BetType(
      color: Colors.white,
      percent: 0,
      amount: 100,
      apate: 30,
      number: i.toString().padLeft(2, '0'),
    );
    list.add(t);
  }
  return list;
}

List<BetType> getThreeD(int index) {
  List<BetType> list = [];
  for (int i = index; i < index + 100; i++) {
    BetType t = BetType(
      color: Colors.white,
      percent: 0,
      amount: 100,
      apate: 30,
      number: i.toString().padLeft(3, '0'),
    );
    list.add(t);
  }
  return list;
}

List<List<BetType>> threeDAllList = [
  getThreeD(0),
  getThreeD(100),
  getThreeD(200),
  getThreeD(300),
  getThreeD(400),
  getThreeD(500),
  getThreeD(600),
  getThreeD(700),
  getThreeD(800),
  getThreeD(900),
];

List<BetType> getFourD(int index) {
  List<BetType> list = [];
  for (int i = index; i < index + 100; i++) {
    BetType t = BetType(
      color: Colors.white,
      percent: 0,
      amount: 100,
      apate: 30,
      number: i.toString().padLeft(4, '0'),
    );
    list.add(t);
  }
  return list;
}

List<List<BetType>> getFourDList(int index) {
  List<List<BetType>> list = [];
  for (int i = index; i < index + 1000; i += 100) {
    List<BetType> fourd = getFourD(index);
    list.add(fourd);
  }
  return list;
}

List<List<BetType>> fourDList0 = [
  getFourD(0),
  getFourD(100),
  getFourD(200),
  getFourD(300),
  getFourD(400),
  getFourD(500),
  getFourD(600),
  getFourD(700),
  getFourD(800),
  getFourD(900),
];
List<List<BetType>> fourDList1 = [
  getFourD(1000),
  getFourD(1100),
  getFourD(1200),
  getFourD(1300),
  getFourD(1400),
  getFourD(1500),
  getFourD(1600),
  getFourD(1700),
  getFourD(1800),
  getFourD(1900),
];
List<List<BetType>> fourDList2 = [
  getFourD(2000),
  getFourD(2100),
  getFourD(2200),
  getFourD(2300),
  getFourD(2400),
  getFourD(2500),
  getFourD(2600),
  getFourD(2700),
  getFourD(2800),
  getFourD(2900),
];
List<List<BetType>> fourDList3 = [
  getFourD(3000),
  getFourD(3100),
  getFourD(3200),
  getFourD(3300),
  getFourD(3400),
  getFourD(3500),
  getFourD(3600),
  getFourD(3700),
  getFourD(3800),
  getFourD(3900),
];
List<List<BetType>> fourDList4 = [
  getFourD(4000),
  getFourD(4100),
  getFourD(4200),
  getFourD(4300),
  getFourD(4400),
  getFourD(4500),
  getFourD(4600),
  getFourD(4700),
  getFourD(4800),
  getFourD(4900),
];
List<List<BetType>> fourDList5 = [
  getFourD(1000),
  getFourD(1100),
  getFourD(1200),
  getFourD(1300),
  getFourD(1400),
  getFourD(1500),
  getFourD(1600),
  getFourD(1700),
  getFourD(1800),
  getFourD(1900),
];
List<List<BetType>> fourDList6 = [
  getFourD(6000),
  getFourD(6100),
  getFourD(6200),
  getFourD(6300),
  getFourD(6400),
  getFourD(6500),
  getFourD(6600),
  getFourD(6700),
  getFourD(6800),
  getFourD(6900),
];
List<List<BetType>> fourDList7 = [
  getFourD(7000),
  getFourD(7100),
  getFourD(7200),
  getFourD(7300),
  getFourD(7400),
  getFourD(7500),
  getFourD(7600),
  getFourD(7700),
  getFourD(7800),
  getFourD(7900),
];
List<List<BetType>> fourDList8 = [
  getFourD(8000),
  getFourD(8100),
  getFourD(8200),
  getFourD(8300),
  getFourD(8400),
  getFourD(8500),
  getFourD(8600),
  getFourD(8700),
  getFourD(8800),
  getFourD(8900),
];
List<List<BetType>> fourDList9 = [
  getFourD(9000),
  getFourD(9100),
  getFourD(9200),
  getFourD(9300),
  getFourD(9400),
  getFourD(9500),
  getFourD(9600),
  getFourD(9700),
  getFourD(9800),
  getFourD(9900),
];

List<List<List<BetType>>> fourDAllList = [
  fourDList0,
  fourDList1,
  fourDList2,
  fourDList3,
  fourDList4,
  fourDList5,
  fourDList6,
  fourDList7,
  fourDList8,
  fourDList9,
];

// List<List<List<BetType>>> getFourDAllList() {
//   List<List<List<BetType>>> list = [];
//   for (int i = 0; i < 10; i++) {
//     List<List<BetType>> lisy = getFourDList(i);
//     list.add(lisy);
//   }
//   return list;
// }


// List<List<BetType>> getSingleThreeD(int index) {
//   List<List<BetType>> list = [];
//   List<BetType> threeD = [];
//   for (int i = index; i < 10; i++) {
//     List<BetType> threeD = getThreeD(i);
//     list.add(threeD);
//   }
//   return list;
// }
