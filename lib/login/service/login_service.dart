import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:async';

Future<FacebookLoginResult> login() async {
  FacebookLogin facebookLogin = FacebookLogin();
  FacebookLoginResult result = await facebookLogin.logInWithReadPermissions(['email']);
  return result;
}

Future<Null> logout() async {
  FacebookLogin facebookLogin = FacebookLogin();
  await facebookLogin.logOut();
  return;
}