import 'package:flash_chat2/screens/login_screen.dart';
import 'package:flash_chat2/screens/registration_screen.dart';
import 'package:flash_chat2/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    animation =
        ColorTween(begin: Colors.white, end: Colors.purple.shade300).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1).withOpacity(1),
                  animation.value,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('assets/images/logo.png'),
                        height: 60.0,
                      ),
                    ),
                    Text(
                      'Flash Chat',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                    labelText: 'Log In',
                    onPressedFunction: () {
                      Navigator.of(context).pushNamed(LoginScreen.id);
                    },
                    backgroundColor: Colors.lightBlueAccent),
                RoundedButton(
                    labelText: 'Register',
                    onPressedFunction: () {
                      Navigator.of(context).pushNamed(RegistrationScreen.id);
                    },
                    backgroundColor: Colors.blueAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
