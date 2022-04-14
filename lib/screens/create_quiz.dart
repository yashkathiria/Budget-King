import 'package:firebase_app_web/Service/data_base.dart';
import 'package:firebase_app_web/screens/home_screen.dart';
import 'package:firebase_app_web/screens/homescreen.dart';
import 'package:firebase_app_web/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'addQuestion.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formkey = GlobalKey<FormState>();
  String quizId;
  final category = TextEditingController();
  final maxamount = TextEditingController();
  DatabaseService databaseService = new DatabaseService();
  bool _isLoding = false;
  int n = 0;
  creatQuizOnline() async {
    quizId = randomAlphaNumeric(16);
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoding = true;
      });

      Map<String, String> quizMap = {
        "category": category.text,
        "maxamount": maxamount.text,
        "quizId": quizId,
      };

      await databaseService.addQuizdata(quizMap, quizId).then((value) {
        setState(() {
          _isLoding = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homescreen(n)),
        );
      });
      setState(() {
        _isLoding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.00,
        title: appBar(context),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: _isLoding
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formkey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      controller: category,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a Category";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter a Category",
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      controller: maxamount,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Set Maximum Amount";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter an amount",
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        creatQuizOnline();
                      },
                      child: blueButton(context: context, lebel: 'Create'),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
