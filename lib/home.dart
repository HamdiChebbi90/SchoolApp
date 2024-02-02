import 'package:flutter/material.dart';
import 'package:project/components/book.dart';
import 'package:project/components/events.dart';
import 'package:project/components/quiz.dart';
import 'package:project/components/subject.dart';
import 'package:project/data/quizdata.dart';
// import 'package:project/data/quizdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  List<Item> items = [];

  @override
  void initState() {
    super.initState();

    items.add(Item('Subjects', 'assets/images/subject.jpg'));
    items.add(Item('Quizzes', 'assets/images/quiz.jpg'));
    items.add(Item('Books', 'assets/images/books.jpg'));
    items.add(Item('Events', 'assets/images/events.jpg'));
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
            flex: 1,
            child: SizedBox(height: 10),
          ),
          Expanded(
            flex: 10,
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
                              builder: (context) => QuizPage(
                                    quiz: quizzes[0],
                                  )));
                    } else if (items[index].title == 'Events') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EventPage()),
                      );
                    }
                  },
                  child: Container(
                    width: 250,
                    height: 250,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            items[index].image,
                            width: 100,
                            height: 100,
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
