import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/cupertino.dart';
import 'service/login_service.dart';
import '../home/home_screen.dart';
import '../service/SharedPreferencesService.dart';

class LoginWidget extends StatefulWidget {
  @override
  LoginState createState() => 
      LoginState();
}

class LoginState extends State<LoginWidget> {
  
  final FacebookLogin facebookSignIn = FacebookLogin();

  final prefs = SharedPreferencesService();

  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> _login() async {
    
    final result = await auth();

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');

        await _persistToken(accessToken.token);
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<void> _persistToken(String token) async => 
      prefs.persistString("FB_TOKEN", token);

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new ExactAssetImage('images/login_bg.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: <Color>[
              const Color.fromRGBO(162, 146, 199, 0.8),
              const Color.fromRGBO(51, 51, 63, 0.9),
            ],
            stops: [1.0, 1.0],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          )
        ),
        child: Stack(
          alignment: const Alignment(0.0, 0.7),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(_message),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: InkWell(
                onTap: () {
                    _login();
                  },
                  child: new SignUp()
              )
            )
          ]
        ),
      )
    );
  }
}

class SignUp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Container(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              margin: const EdgeInsets.all(10.0),
              alignment: FractionalOffset.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(59, 89, 152, 1.0),
                borderRadius: BorderRadius.all(const Radius.circular(30.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.lightbulb_outline,
                    color: Colors.white
                  ),
                  Text(
                    "Log in with Facebook",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3,
                    ),
                  )
                ]
              )
            );
  }
}