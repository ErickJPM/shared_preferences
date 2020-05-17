import 'package:campos/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
class Segunda extends StatefulWidget{
  @override
  _segunda createState() => _segunda();
}

class _segunda extends State<Segunda>{
  var _email= "";
  var _usuario="";
  var _password="";
  @override
  void initState(){
    super.initState();
    analisis();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async => false,
    child:  Scaffold(
      appBar: AppBar (
        title:Text("Ya has iniciado sesion")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.orange,
              child:Text("Este es tu e-mail:"+_email),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Container(color: Colors.blueAccent,
            child:Text("Esta es tu contraeña:"+ _password),),
            Padding(padding: EdgeInsets.all(10.0),),
            Container(color:Colors.deepPurple,
            child:Text("Este es tu nombre de usuario:"+ _usuario),),
            MaterialButton(
              child: Text("CERRAR SESION"),
              color:Colors.red,
              onPressed: borrar,
            )
          ],
        )
      ),
    ),
    );
  }

  Future<void>analisis() async{
    final sharepref= await SharedPreferences.getInstance();
    var email= sharepref.getString("email");
    var user = sharepref.getString("usuario");
    var pass= sharepref.getString("password");
    setState(() {
      _email=email;
      _usuario=user;
      _password=pass;
    });
  }

  Future<void> borrar() async{
    final sharepref= await SharedPreferences.getInstance();
    var email= sharepref.getString("email");
    var user = sharepref.getString("usuario");
    var pass= sharepref.getString("password");
    await sharepref.setString('email', null);
    await sharepref.setString('usuario', null);
    await sharepref.setString('password', null);
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyApp()));
    });
  }



}