import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_service/src/page/home/homePage.dart';

import '../data/data.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({super.key});

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          child:
              SomService().isLoggedIn == true ? HomePage() : buildBtnLogin()),
    );
  }

  Widget buildBtnLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              "assets/img_login.png",
              scale: 1,
            )),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  child: Container(
                      constraints: const BoxConstraints.expand(height: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue[400]),
                      margin: EdgeInsets.only(top: 12),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img_facebook.png",
                            height: 50,
                            width: 50,
                          ),
                          const Text("Login with Facebook ",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        ],
                      )),
                  onTap: () async {
                    FacebookAuth.instance
                        .login(permissions: ["public_profile", "email"]).then(
                            (value) => FacebookAuth.instance
                                    .getUserData()
                                    .then((userData) async {
                                  setState(() {
                                    SomService().isLoggedIn = true;
                                   
                                    //print('#### $userData');
                                    SomService().userObj = userData;
                                  });
                                }));
                  }),
            ),
            SizedBox(height: 20)
          ],
        ),
      ],
    );
  }
}
