import 'dart:convert';

import 'package:flutter/foundation.dart';

class QModel {
  String qus;
  List<String> answer;
  int indexOfCorrect;  // Changed to int

  QModel({
    required this.qus,
    required this.answer,
    required this.indexOfCorrect,
  });

  QModel copyWith({
    String? qus,
    List<String>? answer,
    int? indexOfCorrect,  // Changed to int
  }) {
    return QModel(
      qus: qus ?? this.qus,
      answer: answer ?? this.answer,
      indexOfCorrect: indexOfCorrect ?? this.indexOfCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': qus,
      'answer': answer,
      'indexOfCorrect': indexOfCorrect,
    };
  }

  factory QModel.fromMap(Map<String, dynamic> map) {
    return QModel(
      qus: map['question'] as String,
      answer: List<String>.from(map['answer']),
      indexOfCorrect: map['indexOfCorrect'] as int,  // Changed to int
    );
  }

  String toJson() => json.encode(toMap());

  factory QModel.fromJson(String source) =>
      QModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QModel(question: $qus, answer: $answer, indexOfCorrect: $indexOfCorrect)';

  @override
  bool operator ==(covariant QModel other) {
    if (identical(this, other)) return true;

    return other.qus == qus &&
        listEquals(other.answer, answer) &&
        other.indexOfCorrect == indexOfCorrect;
  }

  @override
  int get hashCode =>
      qus.hashCode ^ answer.hashCode ^ indexOfCorrect.hashCode;
}
