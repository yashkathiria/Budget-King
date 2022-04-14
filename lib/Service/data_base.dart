import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizdata(dynamic quizData, String quizId) async {
    try {
      print("hello hiii");
      await FirebaseFirestore.instance
          .collection("Quiz")
          .doc(quizId)
          .set(quizData);

      print("helooooooooooo");
    } catch (e) {
      print("Error will be acourd on addquizdata");
      print(e);
    }
  }

  Future<void> addQuestionData(questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print("Error in addquestondata in data_base.dart");
      print(e);
    });
  }

  getQuizData() async {
    return await FirebaseFirestore.instance.collection("Quiz").snapshots();
  }
}
