import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordUserController = new TextEditingController();
  String _welcomeString = "";
  void _erase() {
    setState(() {
      _userController.clear();
      _passwordUserController.clear();
    });
  }

  void _showWelcom() {
    setState(() {
      if (_userController.text.isNotEmpty && _passwordUserController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            // Image profile
            new Padding(padding: new EdgeInsets.all(30.0)),
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.greenAccent,
            ),
            new Padding(padding: new EdgeInsets.all(30.0)),
            new Container(
              height: 180.0,
              width: 400.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.all(8.0)),
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: 'Username',
                        icon: new Icon(Icons.person)
                    ),
                  ),
                  new TextField(
                    controller: _passwordUserController,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        // Login Button
                        new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                            onPressed: _showWelcom,
                            color: Colors.deepPurpleAccent,
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.9),
                            ),
                          ),
                        ),
                        // Clear buttons
                        new Container(
                          margin: const EdgeInsets.only(left: 120.0),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.deepPurpleAccent,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               new Text(
                    "Welcome, $_welcomeString",
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 19.4
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
