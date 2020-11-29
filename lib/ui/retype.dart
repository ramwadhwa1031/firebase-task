
import 'package:firebaseapp/ui/login.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  static const String routeName="/pass";

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController _pass = TextEditingController();

  TextEditingController _pass1= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0,
      ),
      body: Center(child: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,

        child:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network("https://icon-library.com/images/reset-password-icon/reset-password-icon-29.jpg",width: 150,),
              
              SizedBox(height:20),

              TextFormField( 
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        controller: _pass,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "enter new password",
                            //labelText: "Name",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.white),
                            )),
                        validator: (val) {
                          
                          return null;
                        }),
                        SizedBox(height:20),
                        TextFormField( 
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        controller: _pass,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "retype password",
                            //labelText: "Name",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.white),
                            )),
                        validator: (val) {
                          
                          return null;
                        }),
                        SizedBox(height:20),
                        RaisedButton(onPressed: (){
                          Navigator.pushReplacementNamed(context, Login.routeName);
                        },child:Text("Click To Save"),color: Colors.white,)
            ],
          ),
        ),
      )),
    );
  }
}