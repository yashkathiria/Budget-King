import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_web/models/cheptervm.dart';
import 'package:firebase_app_web/models/teacherqueandans.dart';
import 'package:firebase_app_web/screens/addQuestion.dart';
import 'package:flutter/material.dart';

class teacherquestion extends StatelessWidget {
  final ChapterVM chapterVM;
  const teacherquestion(
    this.chapterVM,
  );

  @override
  Widget build(BuildContext context) {
    final _qnaListVM = qnaListVM(chapterVM: chapterVM);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome to Quiz'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _qnaListVM.qnaAsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
            final qna = snapshot.data.docs
                .map((doc) => qnaVM.fromSnapshot(doc))
                .toList();

            return ListView.builder(
              itemCount: qna.length,
              itemBuilder: (context, index) {
                return Container(
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.red.shade300,
                        Colors.blue.shade400,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.only(bottom: 100.0),
                  // color: Colors.amber[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.grey.shade400,
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          qna[index].itemname,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Colors.accents;
                          print('tapped');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.blue,
                          ),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            qna[index].price,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Container(
              child: CircularProgressIndicator(
                backgroundColor: Colors.amber,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddQuestion()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
