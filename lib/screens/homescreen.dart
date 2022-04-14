import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_web/models/chepterlistvm.dart';
import 'package:firebase_app_web/models/cheptervm.dart';
import 'package:firebase_app_web/screens/teacherque.dart';
import 'package:firebase_app_web/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'create_quiz.dart';

class Homescreen extends StatelessWidget {
  Stream quizStream;
  final db = FirebaseFirestore.instance;
  int n;
  Homescreen(this.n);
  Future<void> _getUserDoc() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  }

  final _chapterListVM = ChapterListVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.00,
        title: appBar(context),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _chapterListVM.chaptersAsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
            final chapters = snapshot.data.docs
                .map((doc) => ChapterVM.fromSnapshot(doc))
                .toList();

            return ListView.builder(
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              // builder: (context) => ShlokasScreen(
                              //   language: language,
                              //   chapterVM: chapter,
                              // ),
                              builder: (context) => teacherquestion(chapter)),
                        );
                        print("thik thikddfk");
                      },
                      child: Container(
                        height: 200,
                        // color: Colors.blueAccent,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              chapter.Category,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              chapter.maxamount,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )
                            // Image.network(chapter.imageUrl),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            // return  EmptyResultsWidget(message: 'No Chapters');
            return Container(
              child: Text('no lagga'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateQuiz()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String category, id;
  final int noOfQuestions;
  final double maxamount;

  QuizTile({this.maxamount, this.category, this.id, this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => PQuizlay(id)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(category),
                      Text(id),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class DownloadInfo {
//   String file_name;
//   String id;
//   num size;
// }
