class Question {
  String question = '';
  bool answer = false;
  Question(String q, bool a) {
    question = q;
    answer = a;
  }
}

class Qbrain {
  final List<Question> questionBank = [
    Question('this is the first question', true),
    Question('this is the second question', false),
    Question('this is the third question', true),
    Question('this is the forth question', false),
    Question('this is the fifth question', true),
    Question('this is the sixth question', false),
    Question('this is the seventh question', true),
    Question('this is the eight question', false),
    Question('this is the ninth question', true),
    Question('this is the tenth question', false),
  ];

  String question(int qno) {
    return questionBank[qno].question;
  }

  bool answer(int qno) {
    return questionBank[qno].answer;
  }

  bool isFinished(int qno) {
    if (qno == questionBank.length) {
      return true;
    } else {
      return false;
    }
  }
}
