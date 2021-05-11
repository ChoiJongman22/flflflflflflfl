import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginscreen.dart';
import 'package:flutter_application_1/registerscreen.dart';
import 'package:flutter_application_1/userstate.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import 'homescreen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage('usertoken');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (storage.getItem('token') == null) {
              return LoginScreens();
            }
            return HomeScreens();
          },
        ),
        routes: {
          LoginScreens.routeName: (ctx) => LoginScreens(),
          RegisterScreens.routeName: (ctx) => RegisterScreens(),
        },
      ),
    );
  }
}
