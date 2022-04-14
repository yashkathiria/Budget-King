
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key); //video karta alag thi aavel chhe

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get onPressed => null; //video karta alag thi aavel chhe
  String name = "";
  bool changebutton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                Image.asset(
                  "assets/images/B.jpg",
                  fit: BoxFit.contain,
                  height: 350,
                ),
                SizedBox(
                  height: 30.0,
                  child: Text(" Welcome "),
                ),
                Text(
                  " $name ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: " User Name: "),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter User Name";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: " Password: "),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Password";
                          } else if (value.length <= 4) {
                            return "Password should contain at least 5 character";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changebutton ? 50 : 115,
                            height: 45,
                            alignment: Alignment.center,
                            child: changebutton
                                ? Icon(
                                    Icons.done_outline,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                    changebutton ? 150 : 8)),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(minimumSize: Size(115, 40)),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
