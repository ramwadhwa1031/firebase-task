import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Registeration extends StatefulWidget {
  
  static const String routeName="/regist";
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  
  var fs = FirebaseFirestore.instance;
  DateTime selectedData;
  bool ssloader = false;
  var authc = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _pass2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Center(child: Text("Registeration")),
          actions: [
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {},
            ),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: ssloader,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              //height: double.infinity,
              padding: EdgeInsets.all(18),
              color: Theme.of(context).primaryColor,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYgfmsUqhlyH5dU9ESAg6HcgF7jRxGCJCiLA&usqp=CAU",
                      width: 150,
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      controller: _name,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Username",
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
                        if (val.isEmpty) {
                          return "enter name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
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
                        }),
                    SizedBox(height: 20),
                    DateField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      label: "DOB",
                      onDateSelected: (DateTime value) {
                        setState(() {
                          selectedData = value;
                        });
                      },
                      selectedDate: selectedData,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      controller: _contact,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Contact",
                          //labelText: "Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      validator: (value) {
                        if (value.length < 10) {
                          return "Enter Valid Contact";
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value.length <= 4) {
                          return "Insecure Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      controller: _pass2,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Retype-Password",
                          //labelText: "Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      validator: (value) {
                        var x = _pass.text;
                        if (value != x) {
                          return "Enter same password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            ssloader = true;
                          });
                          try {
                            var login =
                                await authc.createUserWithEmailAndPassword(
                                    email: _email.text, password: _pass.text);
                            await fs.collection("Data").add({
                              "name": _name.text,
                              "contact": _contact.text,
                              "dob": selectedData,
                            });
                            if (login.additionalUserInfo.isNewUser == true) {
                              print(selectedData.toString());
                              Navigator.pushReplacementNamed(context, Login.routeName);
                            }
                            print(login);
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      color: Colors.white,
                      textColor: Colors.black54,
                      child: Text("Register"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      
    );
  }
}
