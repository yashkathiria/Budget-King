import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_web/models/cheptervm.dart';

class qnaListVM {
  final ChapterVM chapterVM;

  qnaListVM({
    this.chapterVM,
  });

  Stream<QuerySnapshot> get qnaAsStream {
    return FirebaseFirestore.instance
        .collection('Quiz')
        .doc(chapterVM.refID)
        .collection('QNA')
        .snapshots();
  }
}

class qnaContainer {
  String price;

  String itemname;

  DocumentReference reference;

  qnaContainer({this.price, this.itemname, this.reference});

  String get qnaID {
    return reference.id;
  }

  Map<String, dynamic> toMap() {
    return {"price": price, "itemname": itemname};
  }

  factory qnaContainer.fromSnapshot(QueryDocumentSnapshot doc) {
    return qnaContainer(
      price: doc["price"],
      itemname: doc["itemname"],
      reference: doc.reference,
    );
  }
}

class qnaVM {
  final qnaContainer quizContainer;
  qnaVM({this.quizContainer});

  String get itemname {
    return quizContainer.itemname;
  }

  String get price {
    return quizContainer.price;
  }

  String get refID {
    return quizContainer.qnaID;
  }

  factory qnaVM.fromSnapshot(QueryDocumentSnapshot doc) {
    final _question = qnaContainer.fromSnapshot(doc);
    return qnaVM(quizContainer: _question);
  }
}
