import 'package:flutter/material.dart';
import 'home_screen.dart';

class Adding extends StatefulWidget {
  const Adding({Key key}) : super(key: key);

  @override
  State<Adding> createState() => _AddingState();
}

class _AddingState extends State<Adding> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Add Catogary',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Category ",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Category";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Monthly Limit :"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Minimum Amount";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        // print('pressed');
                        // moveToHome(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
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
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.circular(changebutton ? 150 : 8)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
