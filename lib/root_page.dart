import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/auth.dart';
import 'screens/home_page.dart';
import 'screens/welcome.dart';

class RootPage extends StatefulWidget{
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState()=> new _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState(){
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }
  void _signedout(){
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }




  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn :
        return new LoginPage(
            auth : widget.auth,
            onSignedIn: _signedIn

        );
      case AuthStatus.signedIn :
        return Welcome();
     // return new HomePage(auth:widget.auth,onSignedOut: _signedout,);
       // return new CupertinoStoreApp(auth:widget.auth,);
    }

  }

}

