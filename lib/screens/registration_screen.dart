import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat2/constants.dart';
import 'package:flash_chat2/screens/chat_screen.dart';
import 'package:flash_chat2/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  var authInstance;

  @override
  void initState() {
    // TODO: implement initState
    Firebase.initializeApp();
    authInstance = FirebaseAuth.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              controller: controllerEmail,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kIdTextTextFieldDecoration.copyWith(
                  hintText: 'Enter the email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: controllerPassword,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kIdTextTextFieldDecoration.copyWith(
                  hintText: 'Enter the password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                labelText: 'Register',
                onPressedFunction: () async {
                  try {
                    final user =
                        await authInstance.createUserWithEmailAndPassword(
                            email: controllerEmail.text,
                            password: controllerPassword.text);
                    if (user != null) {
                      Navigator.of(context).pushNamed(ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                backgroundColor: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
