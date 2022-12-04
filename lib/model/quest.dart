class Quest {
  String id, question, answer, appId;
  Quest({
    required this.id,
    required this.question,
    required this.answer,
    required this.appId,
  });

  factory Quest.fromJson(Map<String, dynamic> json) {
    return Quest(
      id: json['_id'],
      question: json['question'],
      answer: json['answer'],
      appId: json['appId'],
    );
  }
}
