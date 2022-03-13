/*
 * @description: 启动页
 * @author: 周金顺（云天河）
 */

import 'package:flutter/material.dart';
import 'package:martina/pages/home_page.dart';
import 'package:martina/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  // 判断用户是否已经读过欢迎信息
  Future<bool> _hasReadHello() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('martina_user_has_read_hello') ?? false;
  }

  _init() {
    _hasReadHello().then((hasRead) {
      Navigator.of(context).pop();
      if (hasRead) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const HomePage()));
        return;
      }
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(backgroundColor: Colors.white),
        home: const Scaffold(
          body: Text('启动'),
        ));
  }
}
