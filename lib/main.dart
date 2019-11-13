import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38,50,56,1),
        body: LoginScreen()
      )
    );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String pass = "admin";

  String animationType = "idle";

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener((){
      if(passwordFocusNode.hasFocus){
        setState(() {
          animationType="test";
        });
      }else{
        setState(() {
          animationType="idle";
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        //just for vertical spacing
        SizedBox(
          height: 60,
          width: 200,
        )    ,


        //space for teddy actor
        Center(
          child: Container(
            height: 300,
            width: 300,

            child: CircleAvatar(
              child: ClipOval(
                child: new FlareActor("assets/teddy_test.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: animationType,),
              ),
              backgroundColor: Colors.white,
            )

          ),
        ),


        //just for vertical spacing
        SizedBox(
          height: 80,
          width: 10,
        )    ,


        //container for textfields user name and password
        Container(
          height: 140,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white
          ),

          child: Column(
            children: <Widget>[

              TextFormField(
                decoration: InputDecoration(border: InputBorder.none, hintText: "User name", contentPadding: EdgeInsets.all(20)),
              ),

              Divider(),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(border: InputBorder.none, hintText: "Password", contentPadding: EdgeInsets.all(20)),
                controller: passwordController,
                focusNode: passwordFocusNode,
              ),

            ],
          ),
        ),

        //container for raised button
        Container(
          width: 350,
          height: 70,
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
              color: Colors.pink,
              child: Text("Submit", style: TextStyle(color: Colors.white),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
              ),
              onPressed: () {
                if(passwordController.text.compareTo(pass) == 0){
                  setState(() {
                    animationType = "success";
                  });

                }else{
                  setState(() {
                    animationType = "fail";
                  });

                }

              }
          ),
        )


      ],
    );
  }
}


