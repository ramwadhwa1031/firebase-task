
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/ui/dashboard.dart';
import 'package:firebaseapp/ui/forgetpass.dart';
import 'package:firebaseapp/ui/registeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static const String routeName="/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   final _formKey = GlobalKey<FormState>();
  bool ssloader = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  var authc = FirebaseAuth.instance;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),
      actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.call), onPressed: (){}),
        ],),
      
      body: ModalProgressHUD(
        inAsyncCall: ssloader,
              child: Container(
            padding: EdgeInsets.all(18),
            color: Theme.of(context).primaryColor,
            child: Form(
              key: _formKey,
                          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS00lpcAmacREZfj8VeyGa39JBezwxgF2BnlA&usqp=CAU",width: 100,),
                    SizedBox(height:20),
                    TextFormField(
                    
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      controller: _email,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Email",
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
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(val)) {
                            return "Enter valid email";
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      controller: _pass,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
                          //labelText: "Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, Forget.routeName);
                  },
                  textColor: Colors.white,
                  child: Text('Forgot Password??',style: TextStyle(fontSize:15),),
                ),
                      ],
                    ),
                    SizedBox(height:20,),
                    RaisedButton(
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          setState(() {
                          ssloader = true;
                        });
                          try{
                            var user = await authc.signInWithEmailAndPassword(email: _email.text, password: _pass.text);
                          if(user != null){
                            Navigator.pushReplacementNamed(context, Dashboard.routeName);
                          }
                          else{
                             Navigator.pushReplacementNamed(context, Registeration.routeName);
                          }

                          }
                          catch(e){
                            print(e);
                          }
                        }
                        
                                            
                        
                      },
                      color: Colors.white,
                      textColor: Colors.black54,
                      child: Text("Login"),
                    )
                  ]),
            ),
          ),
      ),
    );
  }
}
