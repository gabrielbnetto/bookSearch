import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:studies_flutter/pages/checkNotify.dart';

class SingUp extends StatefulWidget {

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUp> {
  
  var _passController = TextEditingController();
  var _confirmPassController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();
  var _birthdayController = TextEditingController();
  var _userController = TextEditingController();
  
  var userIsValid = true;
  var passIsValid = true;
  var confirmIsValid = true;
  var emailIsValid = true;
  var phoneIsValid = true;
  var birthIsValid = true;

  var showHidePass = true;
  var showHideConfirmPass = true;
  var clear = false;

  @override
  void initState() {
    super.initState();
    _userController.addListener(_clear);
  }

  void _toggle(isPass) {
    isPass ?
      setState(() {
        showHidePass = !showHidePass;
      })
    :
      setState(() {
        showHideConfirmPass = !showHideConfirmPass;
      });
    
  }

  void _clear() {
    setState(() {
      (_userController.text != '') ? clear = true : clear = false;
    });
  }

  void validator() {
    var isValid = EmailValidator.validate(_emailController.text);
    (_userController.text.length < 5)? userIsValid = false : userIsValid = true;
    (_passController.text.length < 5)? passIsValid = false : passIsValid = true;
    (_confirmPassController.text != _passController.text || _confirmPassController.text.length < 5)? confirmIsValid = false : confirmIsValid = true;
    (_birthdayController.text.length != 10)? birthIsValid = false : birthIsValid = true;
    (_phoneController.text.length != 14)? phoneIsValid = false : phoneIsValid = true;

    if(!isValid || !userIsValid || !passIsValid || !confirmIsValid || !phoneIsValid || !birthIsValid){
      setState(() {
        emailIsValid = isValid;
        userIsValid = userIsValid;
        passIsValid = passIsValid;
        confirmIsValid = confirmIsValid;
        phoneIsValid = phoneIsValid;
      });
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => CheckNotifyPage()));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/singup.jpg'), 
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Sing Up'),
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
                    obscureText: showHidePass,
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
                          onPressed: () {_toggle(true);},
                          child: Text(showHidePass ? "Show" : "Hide", style: TextStyle(color: Colors.white))
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
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                child: Focus(
                  child: TextField(
                    controller: _confirmPassController,
                    obscureText: showHideConfirmPass,
                    style: TextStyle(color: Colors.white),
                    maxLength: 25,
                    autofocus: false,
                    decoration: InputDecoration(
                      filled: false,
                      counterText: "",
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (confirmIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (confirmIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: (confirmIsValid) ? HexColor('#999999') : HexColor('#f14c4c')),
                      suffixIcon: SizedBox(
                        width: 70,
                        child:FlatButton(
                          onPressed: () {_toggle(false);},
                          child: Text(showHideConfirmPass ? "Show" : "Hide", style: TextStyle(color: Colors.white))
                        )
                      )
                    ),
                  ),
                  onFocusChange: (inFocus){
                    if(!inFocus){
                      (_confirmPassController.text != _passController.text || _confirmPassController.text.length < 5)? confirmIsValid = false : confirmIsValid = true;
                      setState(() {
                        confirmIsValid = confirmIsValid;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                child: Focus(
                  child: TextField(
                    controller: _emailController,
                    autofocus: false,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (emailIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (emailIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: (emailIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                    ),
                  ),
                  onFocusChange: (inFocus){
                    if(!inFocus){
                      var isValid = EmailValidator.validate(_emailController.text);
                      setState(() {
                        emailIsValid = isValid;
                      });
                    }
                  },
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                child: Focus(
                  child: TextField(
                    controller: _phoneController,
                    autofocus: false,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (phoneIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (phoneIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      hintText: 'Phone',
                      hintStyle: TextStyle(color: (phoneIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                    ),
                    inputFormatters: [MaskTextInputFormatter(mask: '(##) ####-####', filter: { "#": RegExp(r'[0-9]')})],
                  ),
                  onFocusChange: (inFocus){
                    if(!inFocus){
                      (_phoneController.text.length != 14)? phoneIsValid = false : phoneIsValid = true;
                      setState(() {
                        phoneIsValid = phoneIsValid;
                      });
                    }
                  },
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                child: Focus(
                  child: TextField(
                    controller: _birthdayController,
                    autofocus: false,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (birthIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(color: (birthIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                      ),
                      hintText: 'Birthday',
                      hintStyle: TextStyle(color: (birthIsValid) ? HexColor('#999999') : HexColor('#f14c4c'))
                    ),
                    inputFormatters: [MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]')})]
                  ),
                  onFocusChange: (inFocus){
                    if(!inFocus){
                      (_birthdayController.text.length != 10)? birthIsValid = false : birthIsValid = true;
                      setState(() {
                        birthIsValid = birthIsValid;
                      });
                    }
                  },
                )
              ),
              RaisedButton(
                onPressed: () {
                  validator();
                },
                child: Text("Sign up", style: TextStyle(fontSize: 15, color: Colors.black)),
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
