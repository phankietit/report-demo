import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse("0x$hexColor"));
}

class _LoginState extends State<Login> {
  final appColor = _getColorFromHex("21977d");
  final appLightColor = _getColorFromHex("4faf9a");
  final appDarkColor = _getColorFromHex("1e8a72");
  final borderRadius = BorderRadius.only(
      topRight: Radius.circular(15),
      topLeft: Radius.circular(15),
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15));
  String _userName = '';
  String _password = '';

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/src/asset/bg_top.jpg"),
                fit: BoxFit.cover)),
        child: loginWidget(),
      ),
    );
  }

  userNameValidator(value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  passwordValidator(value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    return null;
  }

  onLogin() {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      print('Data: $_userName $_password');
    }
  }

  loginWidget() {
    return Column(
      children: <Widget>[
        Container(
          height: 200.0,
          alignment: Alignment.bottomCenter,
          child: Text(
            'PVGAS REPORT',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 35,
                shadows: [
                  Shadow(
                      offset: Offset(-1.5, -1.5),
                      color: _getColorFromHex("516890"),
                      blurRadius: 7),
                  Shadow(
                      offset: Offset(1.5, 1.5),
                      color: _getColorFromHex("032052"),
                      blurRadius: 5),
                ],
                color: _getColorFromHex("01173c")),
          ),
        ),
        Expanded(flex: 1, child: loginForm())
      ],
    );
  }

  loginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            validator: (value) => userNameValidator(value),
            onSaved: (value) => {_userName = value},
            expands: false,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[100]),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[400],
                fontSize: 14.0,
              ),
              contentPadding: EdgeInsets.all(12.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey[100],
              ),
              hintText: 'Nhập tài khoản',
              hintStyle: TextStyle(color: Colors.grey[100]),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: appLightColor),
                borderRadius: borderRadius,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) => passwordValidator(value),
            onSaved: (value) => {_password = value},
            expands: false,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[100]),
            obscureText: true,
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color: Colors.red[400],
                fontSize: 14.0,
              ),
              contentPadding: EdgeInsets.all(12.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey[100],
              ),
              hintText: 'Nhập mật khẩu',
              hintStyle: TextStyle(color: Colors.grey[100]),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: appLightColor),
                borderRadius: borderRadius,
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
                color: appColor,
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                      color: appLightColor,
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(-5, -3)),
                  BoxShadow(
                      color: appDarkColor,
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(3, 5)),
                ]),
            child: FlatButton(
              onPressed: onLogin,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              textColor: Colors.grey[100],
              child: Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
