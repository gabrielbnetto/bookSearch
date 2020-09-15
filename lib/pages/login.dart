import 'package:flutter/material.dart';
import 'package:studies_flutter/pages/home.dart';

class Login extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  var _passController = TextEditingController();
  var _userController = TextEditingController();
  var showHide = true;
  var clear = false;

  @override
  void initState() {
    super.initState();
    _userController.addListener(_clear);
  }

  void _toggle() {
    setState(() {
      showHide = !showHide;
    });
  }

  void _clear() {
    setState(() {
      (_userController.text != '') ? clear = true : clear = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/study_music.jpg'), 
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Sign In'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: TextField(
                  controller: _userController,
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: 'Username',
                    suffixIcon: (clear) ? IconButton(
                      onPressed: () => _userController.clear(),
                      icon: Icon(Icons.clear),
                    ) : null,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                child:TextField(
                  controller: _passController,
                  obscureText: showHide,
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: 'Password',
                    suffixIcon: SizedBox(
                      width: 70,
                      child:FlatButton(
                        onPressed: _toggle,
                        child: Text(showHide ? "Show" : "Hide")
                      )
                    )
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text("Sign in", style: TextStyle(fontSize: 15, color: Colors.white)),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        )
      ]
    );
  }
}
