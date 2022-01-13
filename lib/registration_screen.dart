import 'package:final_rakhmatullin/main_screen.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Страница регистрации'),
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
              Colors.blueAccent,
              'Регистрация',
              () async {
                try {
                  final newUser = await auth.createUserWithEmailAndPassword(
                      email: email, password: password);

                  Navigator.pushNamed(context, MyMainPage.id);
                } catch (e) {
                  print(e);
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
