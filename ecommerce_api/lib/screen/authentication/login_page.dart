import 'dart:convert';

import 'package:ecommerce_api/home_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../widget/common_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    print('Dispose used');
    super.dispose();
  }

  bool _obscureText = true;
  bool val = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoading = false;
  getLogin() async {
    try {
      setState(() {
        isLoading = true;
      });
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      var link = "${baseUrl}sign-in";
      var map = <String, dynamic>{};
      map["email"] = emailController.text.toString();
      map["password"] = passwordController.text.toString();
      var response = await http.post(Uri.parse(link), body: map);
      var data = jsonDecode(response.body);
      setState(() {
        isLoading = false;
      });
      if (data["access_token"] != null) {
        sharedPreferences.setString("token", data["access_token"]);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
      } else {
        showInToast("Email or password doesnt match");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading == true,
          blur: 0.5,
          opacity: 0.5,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.only(top: 50, left: 15.0, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF217298)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onTap: () {},
                    validator: (value) {
                      var emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.toString());

                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (emailValid == false) {
                        return "Invalid email";
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'email@domain.com',
                        filled: true,
                        fillColor: Color(0XFFf3fafd),
                        labelStyle:
                            TextStyle(color: Color(0XFF76a7be), fontSize: 18),
                        border: OutlineInputBorder()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF217298)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Checkbox(
                                value: val,
                                onChanged: (value) {
                                  setState(() {
                                    if (val = value!) {
                                      _toggle();
                                    } else {
                                      _toggle();
                                    }
                                  });
                                }),
                            Text(
                              'Show',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF217298)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onTap: () {},
                    obscureText: _obscureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0XFFf3fafd),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color(0XFF76a7be), fontSize: 18),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            getLogin();

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter all fields')),
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xFF4eb8dd)),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
