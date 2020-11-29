
import 'package:firebaseapp/ui/login.dart';
import 'package:firebaseapp/ui/registeration.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0,

      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw2gLdALmJFpybWLgJoBRVPoHyDG1j1jeXkg&usqp=CAU"),
             SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Login.routeName);
                  },
                  child: Center(
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Registeration.routeName);
                  },
                  child: Center(
                    child: Text("Registeration",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
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