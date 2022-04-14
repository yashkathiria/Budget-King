import 'package:cloud_firestore/cloud_firestore.dart';

class QuizContainer {
  String category;
  String maxamount;
  String quizid;

  DocumentReference reference;

  QuizContainer({
    this.category,
    this.maxamount,
    this.quizid,
    this.reference,
  });

  String get chapterID {
    return reference.id;
  }

  String get decription => null;

  Map<String, dynamic> toMap() {
    return {
      "quizId": quizid,
      "quizImageurl": category,
      "category": category,
      "maxamount": maxamount,
    };
  }

  factory QuizContainer.fromSnapshot(QueryDocumentSnapshot doc) {
    return QuizContainer(
      quizid: doc["quizId"],
      category: doc["category"],
      maxamount: doc["maxamount"],
      reference: doc.reference,
    );
  }
}
