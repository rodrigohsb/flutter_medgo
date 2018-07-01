import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:async';

Future<FacebookLoginResult> auth() async {
  FacebookLogin facebookLogin = new FacebookLogin();
  FacebookLoginResult result = await facebookLogin.logInWithReadPermissions(['email']);
  return result;
}