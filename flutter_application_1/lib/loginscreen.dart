import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_application_1/userstate.dart';
import 'package:provider/provider.dart';

import 'registerscreen.dart';

class LoginScreens extends StatefulWidget {
  static const routeName = '/login-screens';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreens> {
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();
  void loginNew() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool istoken = await Provider.of<UserState>(
      context,
      listen: false,
    ).loginNow(_username, _password);
    if (istoken) {
      Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something is wrong. Try Again"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Now"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                validator: (v) {
                  if (v.isEmpty) {
                    return "Enter Your Username";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Username"),
                onSaved: (v) {
                  _username = v;
                },
              ),
              TextFormField(
                validator: (v) {
                  if (v.isEmpty) {
                    return "Enter Your password";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Password"),
                onSaved: (v) {
                  _password = v;
                },
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      loginNew();
                    },
                    child: Text("Login"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RegisterScreens.routeName);
                    },
                    child: Text("Register New"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
