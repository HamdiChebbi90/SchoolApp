class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final String question;
  final List<Answer> answers;

  Question({required this.question, required this.answers});
}

class Answer {
  final String text;
  final bool isCorrect;

  Answer({required this.text, required this.isCorrect});
}

List<Quiz> quizzes = [
  Quiz(title: 'Math', questions: [
    Question(question: 'What is 2 + 2?', answers: [
      Answer(text: '4', isCorrect: true),
      Answer(text: '22', isCorrect: false),
      Answer(text: '12', isCorrect: false),
      Answer(text: '42', isCorrect: false),
    ]),
    Question(question: 'What is 3 + 3?', answers: [
      Answer(text: '6', isCorrect: true),
      Answer(text: '33', isCorrect: false),
      Answer(text: '13', isCorrect: false),
      Answer(text: '63', isCorrect: false),
    ]),
    Question(question: 'What is 4 + 4?', answers: [
      Answer(text: '8', isCorrect: true),
      Answer(text: '44', isCorrect: false),
      Answer(text: '14', isCorrect: false),
      Answer(text: '84', isCorrect: false),
    ]),
    Question(question: 'What is the capital of France?', answers: [
      Answer(text: 'New York', isCorrect: false),
      Answer(text: 'London', isCorrect: false),
      Answer(text: 'Paris', isCorrect: true),
      Answer(text: 'Dublin', isCorrect: false),
    ]),
    Question(question: 'Who is CEO of Tesla?', answers: [
      Answer(text: 'Jeff Bezos', isCorrect: false),
      Answer(text: 'Elon Musk', isCorrect: true),
      Answer(text: 'Bill Gates', isCorrect: false),
      Answer(text: 'Tony Stark', isCorrect: false),
    ]),
    Question(question: 'The iPhone was created by which company?', answers: [
      Answer(text: 'Apple', isCorrect: true),
      Answer(text: 'Intel', isCorrect: false),
      Answer(text: 'Amazon', isCorrect: false),
      Answer(text: 'Microsoft', isCorrect: false),
    ]),
    Question(question: 'How many Harry Potter books are there?', answers: [
      Answer(text: '1', isCorrect: false),
      Answer(text: '4', isCorrect: false),
      Answer(text: '6', isCorrect: false),
      Answer(text: '7', isCorrect: true),
    ]),
    Question(question: 'How many sides does a triangle have?', answers: [
      Answer(text: '3', isCorrect: true),
      Answer(text: '4', isCorrect: false),
      Answer(text: '5', isCorrect: false),
      Answer(text: '6', isCorrect: false),
    ]),
  ]),
];
