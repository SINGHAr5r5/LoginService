import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../main.dart';
import '../data/data.dart';
import '../login/loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String profilePicture = SomService().userObj['picture']['data']['url'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.red,
                  child: Image.network(
                      'https://img.freepik.com/premium-vector/abstract-technology-binary-code-background_6735-500.jpg',
                      fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: -60,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: 150,
                        height: 150,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profilePicture),
                        )),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SomService().userObj["name"] ?? "Name",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        SomService().userObj["email"] ?? "Email",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
          ]),
        ),
        Container(
          child: _buildButtonTest(context),
        ),
      ],
    );
  }

  Widget _buildButtonTest(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                _buildBtnShowBottomSheet(),
              ],
            ),
          ),
        )
       
       
        ,
        const SizedBox(height: 30)
      ],
    );
  }

  Widget _buildBtnLogout() {
    return InkWell(
        child: Container(
            margin: const EdgeInsets.only(top: 20.0),
            constraints: const BoxConstraints.expand(height: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(255, 232, 232, 232)),
            // margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                Text("LoginOut ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 4, 4, 4))),
              ],
            )),
        onTap: () {
          FacebookAuth.instance.logOut().then((value) {
            setState(() {
              SomService().isLoggedIn = false;

              if (SomService().isLoggedIn == false) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogingPage()),
                );
              }
            });
          });
        });
  }

  Widget _buildBottomSheet() {
    return ElevatedButton(
      child: const Text('LogOut'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Stack(
    clipBehavior: Clip.none,
    children: [
        Container(
            width: double.infinity,
            height: 200,
            color: Color.fromARGB(255, 254, 254, 254),
            child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Logout App Service'),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _buildBtnLogout(),
                    ),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),)
        ),
        Positioned(
            top: -50,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                          backgroundImage: NetworkImage(profilePicture),
              ),
                  
              ),
            ),
        ),
    ],
);
          },
        );
      },
    );
  }
  Widget _buildBtnShowBottomSheet(){
    return   FloatingActionButton(
        onPressed: (){
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Stack(
    clipBehavior: Clip.none,
    children: [
        Container(
            width: double.infinity,
            height: 200,
            color: Color.fromARGB(255, 254, 254, 254),
            child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Logout App Service'),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: _buildBtnLogout(),
                    ),
                    
                  ],
                ),)
        ),
        Positioned(
            top: -50,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                          backgroundImage: NetworkImage(profilePicture),
              ),
                  
              ),
            ),
        ),
        Positioned(
            top: -30,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: 50,
                  height: 50,
                   child: InkWell(
                      child: Image.asset("assets/ic_cloes.png"),
                      onTap: () => Navigator.pop(context),
                    ),
                  
                  
              ),
            ),
        ),
        
    ],
);
          },
        );
      },
        tooltip: 'ออกจากระบบ',
        child: const Icon(Icons.logout_outlined),
      );
  }
}
