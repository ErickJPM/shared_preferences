import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'segunda.dart';

class homePage extends StatefulWidget{
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>{
  double buttonHigh = 50;
  double buttonWidth = 100;

  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _usuario = new TextEditingController();
  @override
  void initState(){
    super.initState();
    _redirectionAnalisis();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("INICIA SESION"),
      ),
        body:new Container(
          padding: EdgeInsets.all(40.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(hintText: "email:"),
                controller: _email,
              ),
              new TextField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(hintText: "contraseña:"),
                controller: _password,
              ),
              new TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: new InputDecoration(hintText: "usuario:"),
                controller: _usuario,
              ),
              Padding(padding: EdgeInsets.all(20),),
              MaterialButton(
                color: Colors.red,
                child:Text("INICIAR SESION"),
                onPressed: _registro,
              ),
            ],
          ),
        ),
    );
  }

  Future<void> _redirectionAnalisis() async {
    final sharepref= await SharedPreferences.getInstance();
    var email= sharepref.getString("email");
    var user = sharepref.getString("usuario");
    var pass= sharepref.getString("password");
    setState(() {
      if ((user != null) && (pass!=null) && (email!=null)){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Segunda()));
      }
    });

  }

  Future<void> _registro() async {
    final sharepref= await SharedPreferences.getInstance();
    var email= _email.text;
    var user = _usuario.text;
    var pass= _password.text;
    print("oye");
    print(email);
    print(user);
    print(pass);
    if ((user == "") || (pass=="") || (email=="")){
      await sharepref.setString('email', null);
      await sharepref.setString('usuario', null);
      await sharepref.setString('password', null);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => homePage()));
    }
    else{
      await sharepref.setString('email', email);
      await sharepref.setString('usuario', user);
      await sharepref.setString('password', pass);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Segunda()));
    }
    setState(() {
    });

  }
}