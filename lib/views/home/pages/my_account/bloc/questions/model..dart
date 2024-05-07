class QuestionsData {

  late final List<QuestionModel> data;
  late final String status;
  late final String message;
  
  QuestionsData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>QuestionModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }


}

class QuestionModel {

  late final int id;
  late final String question;
  late final String answer;
  
  QuestionModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }


}