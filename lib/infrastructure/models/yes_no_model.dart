class YesOrNoModel {
  String answer;
  bool forced;
  String image;

  YesOrNoModel(
      {required this.answer, required this.forced, required this.image});

  factory YesOrNoModel.fromJsonMap(Map<String, dynamic> json) {
    return YesOrNoModel(answer: json['answer'], forced: json['forced'], image: json['image']);
  }
}
