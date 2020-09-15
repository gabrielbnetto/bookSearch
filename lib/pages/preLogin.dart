import 'package:flutter/material.dart';
import 'package:studies_flutter/pages/login.dart';
import 'package:studies_flutter/pages/singup.dart';

class PreLogin extends StatefulWidget {

  @override
  _PreLoginPageState createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('images/stores.png', width: 300),
            Column(
              children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text("Sign in", style: TextStyle(fontSize: 20, color: Colors.white)),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  )
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SingUp()));
                    },
                    child: Text("Sign up", style: TextStyle(fontSize: 20, color: Colors.white)),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  )
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Later", style: TextStyle(fontSize: 15)),
                )
              ]
            )
          ],
        ),
      )
    );
  }
}
