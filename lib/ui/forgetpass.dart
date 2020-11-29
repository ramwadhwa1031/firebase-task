import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  static const String routeName="/forget";

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController _email = TextEditingController();

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

              TextFormField( keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        controller: _email,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "enter registered email",
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
                        SizedBox(height:20),
                        RaisedButton(onPressed: (){},child:Text("Click To verify email"),color: Colors.white,)
            ],
          ),
        ),
      )),
    );
  }
}