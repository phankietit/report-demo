import 'package:flutter/material.dart';

class Plash extends StatefulWidget {
  @override
  _PlashState createState() => _PlashState();
}

class _PlashState extends State<Plash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _checkLogin() {}

  _setPage() {
    Navigator.pushNamed(context, '/login');
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/src/asset/bg_top.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 120, bottom: 50),
                child: Text(
                  "PVGas Report",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 36),
                ),
              ),
              Image.asset(
                "lib/src/asset/favicon.png",
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 10),
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  width: 20,
                  height: 20,
                ),
              ),
              Text(
                'Đang tải dữ liệu...',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
