import 'package:cloud_firestore/cloud_firestore.dart';

class ChapterListVM {
  ChapterListVM();

  Stream<QuerySnapshot> get chaptersAsStream {
    return FirebaseFirestore.instance
        .collection('Quiz')
        // .orderBy("chapterNumber")
        .snapshots();
  }
}
