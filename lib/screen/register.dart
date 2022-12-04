import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/uis.dart';
import '../widgets/text_input_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const String routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obsecureText = true;

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
                text: REGISTER,
                color: Colors.white,
                weight: FontWeight.bold,
                size: 40,
                family: 'Courier',
                tcapital: true,
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _form,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      TextInput(
                        controller: _nameController,
                        hintText: 'Name',
                        icon: Icons.person,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        suffixIconClick: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
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
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: text(
                      text: LOGIN_NOW,
                      color: ACCENT_3,
                      size: 16.0,
                      family: 'Fira',
                    ),
                  ),
                  btn(
                    text: REGISTER,
                    cb: () {
                      v();
                      print('Register clicked');
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
