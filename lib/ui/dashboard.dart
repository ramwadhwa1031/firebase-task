
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";
  

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  
  var authc = FirebaseAuth.instance;
  Future signout() async {
    try {
      return await authc.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Demo 1'),
    Text('Demo 2'),
    Text('Demo 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          FlatButton.icon(
              onPressed: () async {
                 await signout();
                 Navigator.pushReplacementNamed(context, Login.routeName);
              }, icon: Icon(Icons.person), label: Text("Logout"))
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('User DAta')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text('Profile')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favourites')),
        ],
        currentIndex: selectedIndex,
        //fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}