import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;
  Map _userObj={};

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login service"),
      ),
      body: Container(width: MediaQuery.of(context).size.width,
      child:_isLoggedIn==true? buildBtnLogOut():buildBtnLogin())
     
    );
  }
  Widget buildBtnLogin(){
    return Center(
        child: ElevatedButton(
        child: Text("Login with facebook "),
        onPressed: () async { 
          FacebookAuth.instance.login(
            permissions: ["public_profile","email"]
          ).then((value) => FacebookAuth.instance.getUserData().then((userData)async{
            setState(() {
                _isLoggedIn = true;
                _userObj=userData;
              });
          }));
         },),
        
        );
  }
   Widget buildBtnLogOut(){
    return Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(_userObj["name"]),Text(_userObj["email"]),
        TextButton(onPressed: (){
          FacebookAuth.instance.logOut().then((value){
            setState(() {
                _isLoggedIn = false;
                _userObj={};
              });
                    });
        },
         child: Text('LogOut'))
        ],);
  }
}
