import 'package:firebase_app_web/Service/data_base.dart';
import 'package:firebase_app_web/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  String quizId;

  AddQuestion();

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formkey = GlobalKey<FormState>();
  // late String question, option1, option2, option3, option4;
  final itemname = TextEditingController();
  final price = TextEditingController();

  bool _isLoding = false;
  DatabaseService databaseService = new DatabaseService();

  uploadQuestionData() {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoding = true;
      });
      Map<String, String> questionMap = {
        "itemname": itemname.text,
        "price": price.text,
      };

      databaseService.addQuestionData(questionMap, widget.quizId).then((value) {
        itemname.text = "";
        price.text = "";

        setState(() {
          _isLoding = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("error is happening ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.00,
        title: appBar(
          context,
        ),
      ),
      body: _isLoding
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formkey,
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: itemname,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a question";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Item Name",
                        ),
                        // onChanged: (val) {
                        //   question = val;
                        // },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        controller: price,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an Amount";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Max Amount",
                        ),
                        // onChanged: (val) {
                        //   option1 = val;
                        // },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          //   child: blueButton(
                          //       context: context,
                          //       lebel: 'Submit',
                          //       bottonwidth:
                          //           MediaQuery.of(context).size.width / 2 - 36),
                          // ),
                          // SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                uploadQuestionData();
                              });
                            },
                            child: blueButton(
                                context: context,
                                lebel: 'Add Question',
                                bottonwidth:
                                    MediaQuery.of(context).size.width / 2 - 36),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
