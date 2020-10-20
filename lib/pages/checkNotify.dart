import 'package:flutter/material.dart';
import 'package:studies_flutter/pages/home.dart';

// ignore: must_be_immutable
class CheckNotifyPage extends StatefulWidget {

  @override
  _CheckNotifyPageState createState() => _CheckNotifyPageState();
}

class _CheckNotifyPageState extends State<CheckNotifyPage> {
  bool notify = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('images/stores.png', width: 300),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[  
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 10),
                      child: Checkbox(
                        value: notify,
                        onChanged: (bool notifyVal){
                          setState((){
                            notify = notifyVal;
                          });
                        }
                      )
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        child:Text("Assinale a caixa ao lado para ser notificado sobre atualizações e ofertas do App!"),
                      )
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child:SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        print(notify);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text("OK", style: TextStyle(fontSize: 20, color: Colors.white)),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    )
                  )
                ),
              ]
            )
          ],
        ),
      )
    );
  }
}
