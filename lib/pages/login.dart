import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studies_flutter/pages/home.dart';

class Login extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  var _passController = TextEditingController();
  var _userController = TextEditingController();
  var passIsValid = true;
  var userIsValid = true;
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

  void validator() {
    (_userController.text.length < 5)? userIsValid = false : userIsValid = true;
    (_passController.text.length < 5)? passIsValid = false : passIsValid = true;

    if(!userIsValid || !passIsValid){
      setState(() {
        userIsValid = userIsValid;
        passIsValid = passIsValid;
      });
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
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
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Focus(
                  child: TextField(
                    controller: _userController,
                    autofocus: true,
                    maxLength: 20,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: false,
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (userIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (userIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: (userIsValid) ? HexColor('#999999') : HexColor('#f14c4c')),
                      suffixIcon: (clear) ? IconButton(
                        onPressed: () => _userController.clear(),
                        icon: Icon(Icons.clear, color: Colors.white),
                      ) : null,
                    ),
                  ),
                  onFocusChange: (inFocus){
                    if(!inFocus){
                      (_userController.text.length < 5)? userIsValid = false : userIsValid = true;
                      setState(() {
                        userIsValid = userIsValid;
                      });
                    }
                  },
                )
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                child: Focus(
                  child: TextField(
                    controller: _passController,
                    obscureText: showHide,
                    maxLength: 25,
                    style: TextStyle(color: Colors.white),
                    autofocus: false,
                    decoration: InputDecoration(
                      filled: false,
                      counterText: "",
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (passIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (passIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: (passIsValid) ? HexColor('#999999') : HexColor('#f14c4c')),
                      suffixIcon: SizedBox(
                        width: 70,
                        child:FlatButton(
                          onPressed: _toggle,
                          child: Text(showHide ? "Show" : "Hide", style: TextStyle(color: Colors.white))
                        )
                      ),
                    ),
                  ),
                  onFocusChange: (inFocus){
                    if(!inFocus){
                      (_passController.text.length < 5)? passIsValid = false : passIsValid = true;
                      setState(() {
                        passIsValid = passIsValid;
                      });
                    }
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  validator();
                },
                child: Text("Sign in", style: TextStyle(fontSize: 15, color: Colors.black)),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        )
      ]
    );
  }
}
