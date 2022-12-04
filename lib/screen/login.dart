import 'dart:convert';

import 'package:app/provider/ballone_provider.dart';
import 'package:app/provider/lager_provider.dart';
import 'package:app/provider/slip_provider.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/uis.dart';
import 'package:app/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _phoneController =
      TextEditingController(text: '09600600600');
  final TextEditingController _passwordController =
      TextEditingController(text: '123123123');
  bool _obsecureText = true;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: gradient(),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  text: LOGIN,
                  color: Colors.white,
                  weight: FontWeight.bold,
                  size: 40,
                  tcapital: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextInput(
                          controller: _phoneController,
                          hintText: 'Phone',
                          icon: Icons.phone,
                          textInputType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInput(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icons.lock,
                          obsecureText: _obsecureText,
                          suffixIcon: _obsecureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixIconClick: () =>
                              setState(() => _obsecureText = !_obsecureText),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        v();
                        Navigator.of(context).pushReplacementNamed('/register');
                      },
                      child: text(
                        text: REGISTER_NOW,
                        color: ACCENT_3,
                        size: 16.0,
                        family: 'Fira',
                      ),
                    ),
                    btn(
                      text: LOGIN,
                      cb: () async {
                        await _login(context);
                      },
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  Future<void> _login(BuildContext context) async {
    v();
    setState(() {
      _loading = true;
    });
    _loading
        ? showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return WillPopScope(
                onWillPop: () => Future.value(false),
                child: AlertDialog(
                  backgroundColor: ACCENT_1,
                  content: SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loadingIndicator,
                      ],
                    ),
                  ),
                ),
              );
            })
        : Navigator.of(context).pop();
    String phone = _phoneController.value.text;
    String password = _passwordController.value.text;
    var json = jsonEncode({
      "phone": phone,
      "password": password,
      "appId": APP_ID,
    });
    await Provider.of<AuthProvider>(context, listen: false).login(json: json);
    var success = Provider.of<AuthProvider>(context, listen: false).success;
    var errMsg = Provider.of<AuthProvider>(context, listen: false).errMsg;
    if (success) {
      String token =
          Provider.of<AuthProvider>(context, listen: false).user.token;
      await Provider.of<LagerProvider>(context, listen: false)
          .getAllLagers(token: token);
      await Provider.of<BalloneProvider>(context, listen: false)
          .getBody(token: token);
      await Provider.of<BalloneProvider>(context, listen: false)
          .getMoung(token: token);
      await Provider.of<SlipProvider>(context, listen: false).getSlips(
        token: token,
        startDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
        endDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
      );
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else {
      toastFlash(context, errMsg);
      Navigator.of(context).pop();
    }
    setState(() {
      _loading = false;
    });
  }
}
