import 'package:final_rakhmatullin/main_screen.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Неверное имя пользователя, либо пароль.",
      desc: "Введите верное имя пользователя, либо пароль.",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Страница авторизации'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 200.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Введите ваш адрес эл.почты'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Введите пароль'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              Colors.lightBlueAccent,
              'Авторизация',
              () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushNamed(context, MyMainPage.id);
                } catch (e) {
                  print(e);
                  _onBasicAlertPressed(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
