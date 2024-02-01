import 'package:flutter/material.dart';
import 'package:project/components/book.dart';
import 'package:project/components/quiz.dart';
import 'package:project/components/subject.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  final _quiz = Quiz(title: 'title', questions: [
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
  ]);
  List<Item> items = [];

  @override
  void initState() {
    super.initState();

    items.add(Item('Subjects', '/images/subject.jpg'));
    items.add(Item('Quizzes', '/images/quiz.jpg'));
    items.add(Item('Books', '/images/books.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (items[index].title == 'Subjects') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SubjectPage()),
                      );
                    } else if (items[index].title == 'Books') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BooksPage()),
                      );
                    } else if (items[index].title == 'Quizzes') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(quiz: _quiz)),
                      );
                    }
                  },
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          items[index].image,
                          width: 300,
                          height: 300,
                          alignment: Alignment.center,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          items[index].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(131, 0, 0, 0),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Element'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        items.add(Item(
                            _titleController.text, 'assets/images/math.png'));
                        _titleController.clear();
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Item {
  String title;
  String image;

  Item(this.title, this.image);
}
