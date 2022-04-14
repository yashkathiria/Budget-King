import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_web/models/quizcontainer.dart';

class ChapterVM {
  ChapterVM({this.quizContainer});
  QuizContainer quizContainer;

  // ChapterVM();

  String get Category {
    return quizContainer.category;
  }

  String get maxamount {
    return quizContainer.maxamount;
  }

  String get refID {
    return quizContainer.chapterID;
  }

  factory ChapterVM.fromSnapshot(QueryDocumentSnapshot doc) {
    final _chapter1 = QuizContainer.fromSnapshot(doc);
    return ChapterVM(quizContainer: _chapter1);
  }
}
