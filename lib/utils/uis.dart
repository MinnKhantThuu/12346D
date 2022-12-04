import 'package:app/screen/login.dart';
import 'package:app/utils/constants.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

LinearGradient gradient() {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.3,
      0.6,
      0.9,
    ],
    colors: [
      Color(0xff333679),
      Color(0xff2B2D6A),
      Color(0xff1E2055),
      Color(0xff171741),
    ],
  );
}

Future<void> toastFlash(BuildContext context, String txt) {
  return showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (_, c) {
      return Flash(
        controller: c,
        barrierDismissible: false,
        alignment: const Alignment(0, 0.8),
        borderRadius: BorderRadius.circular(12),
        // backgroundColor: Colors.black.withOpacity(0.8),
        backgroundColor: ACCENT_4,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: text(
            text: txt,
            family: 'Myanmar',
            size: 16,
            weight: FontWeight.bold,
          ),
        ),
      );
    },
  );
}

Text text({
  required text,
  double size: 16,
  FontWeight weight: FontWeight.normal,
  FontStyle style: FontStyle.normal,
  String family: 'Courier',
  Color bgColor: Colors.transparent,
  Color color: Colors.white,
  bool tcapital: false,
}) {
  return Text(
    tcapital ? text.toUpperCase() : text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: family,
      backgroundColor: bgColor,
      color: color,
    ),
  );
}

Route createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, animation, secondaryAnimation) => Login(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Widget btn({required String text, required Function cb}) {
  return Container(
    // width: 104,
    height: 45,
    child: ElevatedButton(
      onPressed: () => cb(),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: Color(0xff3F41A7),
      ),
    ),
  );
}

Widget textBtn(
    {required context, required String namedRoute, required String txt}) {
  return TextButton(
    onPressed: () => Navigator.of(context).pushReplacementNamed(namedRoute),
    child: text(
      text: txt,
      color: ACCENT_1,
      size: 16.0,
      family: 'Fira',
    ),
  );
}

AppBar appbar(String title) {
  return AppBar(
    backgroundColor: PRIMARY_COLOR,
    // centerTitle: true,
    title: text(
      text: title,
      weight: FontWeight.bold,
      size: 26,
      family: 'Myanmar',
    ),
  );
}

SizedBox oneCellInput(
  BuildContext context,
  TextEditingController controller,
) {
  return SizedBox(
    height: 60,
    width: 60,
    child: TextField(
      autofocus: true,
      controller: controller,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (value.length == 0) {
          FocusScope.of(context).previousFocus();
        }
        // if (event.logicalKey == LogicalKeyboardKey.backspace) {
        //   print('backspace clicked');
        // }
      },
      style: TextStyle(
        fontFamily: 'Fira',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ACCENT_2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ACCENT_2,
          ),
        ),
      ),
    ),
  );
}

Container appbarTextField({required TextEditingController controller}) {
  return Container(
    padding: EdgeInsets.only(
      top: 5,
    ),
    height: 50,
    width: 100,
    child: TextFormField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp('^[0-9]+')),
      ],
      cursorColor: Colors.white,
      textAlign: TextAlign.end,
      controller: controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Fira',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          fillColor: Colors.white,
          filled: false,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              ))),
    ),
  );
}

TableRow tableRow({
  required String r1,
  required String r2,
  required String r3,
  Widget? r4,
  Widget? r5,
  Color fcolor: Colors.white,
  FontWeight fweight: FontWeight.normal,
  String ffamily: 'Myanmar',
  double theight: 60,
}) {
  return TableRow(
    decoration: BoxDecoration(
      color: ACCENT_1,
    ),
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r1,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: 60,
          child: Center(
            child: text(
              text: r2,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r3,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      if (r4 != null)
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            height: theight,
            child: Center(
              child: r4,
            ),
          ),
        ),
      if (r5 != null)
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            height: theight,
            child: Center(
              child: r5,
            ),
          ),
        ),
    ],
  );
}

const rowSpacer = TableRow(children: [
  SizedBox(
    height: 2,
  ),
  SizedBox(
    height: 2,
  ),
  SizedBox(
    height: 2,
  ),
]);
