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
  Quiz(
      title: '2020مناظرة القبول بالسنة الأولى بالمعھد الأعلى للمحاماة',
      questions: [
        Question(
            question:
                'تعلم مصالح الجباية المطالب بالأداء بنتائج عملية المراجعة الأولية لتصاريحه أو عقوده أو كتاباته في أجل',
            answers: [
              Answer(
                  text:
                      ' يوما من تاريخ إنقضاء الأجل الذي إقتضاه القانون منه90 ',
                  isCorrect: false),
              Answer(text: '6 أشهر', isCorrect: true),
              Answer(text: 'عام', isCorrect: false),
            ]),
        Question(question: 'رئيس اللجنة الوطنية للمصالحة هو', answers: [
          Answer(text: 'المستشار القانوني لوزارة المالية', isCorrect: false),
          Answer(text: 'مستشار المحكمة الإدارية', isCorrect: true),
          Answer(text: 'الموفق الجبائي أو من ينوبه', isCorrect: false),
        ]),
        Question(question: 'أحدث المجلس الوطني للجباية بمقتضى', answers: [
          Answer(
              text: 'الفصل 3 من مجلة الحقوق و الإجراءات الجبائية',
              isCorrect: false),
          Answer(
              text: 'الفصل 4 من مجلة الحقوق و الإجراءات الجبائية',
              isCorrect: false),
          Answer(
              text: 'الفصل 65 من مجلة الحقوق و الإجراءات الجبائية',
              isCorrect: true),
        ]),
        Question(
            question:
                'تقدم العرائض المتعلقة بإلتماس إعادة النظر في قرارات التوظيف الإجباري التي لم يصدر في شأنها حكم في الأصل إلى',
            answers: [
              Answer(text: 'وزير المالية', isCorrect: false),
              Answer(text: 'المجلس الوطني للجباية', isCorrect: true),
              Answer(text: 'اللجنة الوطنية للمصالحة', isCorrect: false),
            ]),
        Question(
            question:
                'يعاقب كل شخص لم يقم بدفع الأداءات الموظفة على وسائل النقل بالطرقات',
            answers: [
              Answer(
                  text: 'بخطية تساوي 100 % من مبلغ الأداء المستوجب',
                  isCorrect: false),
              Answer(
                  text: 'بخطية تساوي 200 % من مبلغ الأداء المستوجب',
                  isCorrect: true),
              Answer(text: 'بخطية قدرها 20 دينار', isCorrect: false),
            ]),
        Question(
            question:
                'للمحكمة إذا قضت بالسجن النافذ لمدة أقصاها عام واحد أن تستبدل بنفس الحكم تلك العقوبة بعقوبة',
            answers: [
              Answer(text: 'العمل لفائدة المصلحة العامة', isCorrect: false),
              Answer(text: 'المراقبة الإلكترونية', isCorrect: false),
              Answer(
                  text:
                      'العمل لفائدة المصلحة العامة أو بعقوبة المراقبة الإلكترونية',
                  isCorrect: true),
            ]),
        Question(
            question:
                'الجمع بين عقوبة العمل لفائدة المصلحة العامة أو عقوبة المراقبة الإلكترونية و عقوبة السجن',
            answers: [
              Answer(text: 'ممكن', isCorrect: false),
              Answer(text: 'لا يمكن', isCorrect: false),
              Answer(
                  text: 'ممكن إذا كانت عقوبة السجن أقل من سنة',
                  isCorrect: true),
            ]),
        Question(
            question: 'تكرر إرتكاب السكر يوجب العقاب بالسجن مدة',
            answers: [
              Answer(text: 'شهر', isCorrect: false),
              Answer(text: 'شهر و عشرون يوم', isCorrect: false),
              Answer(text: 'ستة أشهر', isCorrect: true),
            ]),
      ]),
];
