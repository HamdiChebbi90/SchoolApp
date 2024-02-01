import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List<Subject> subjects = [];
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    subjects.add(Subject('Math', '/images/math.jpg'));
    subjects.add(Subject('Science', '/images/science.jpg'));
    subjects.add(Subject('History', '/images/history.jpg'));
    subjects.add(Subject('Geography', '/images/geography.jpg'));
    subjects.add(Subject('English', '/images/english.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InfoPage(subject: subjects[index])),
              );
            },
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    subjects[index].image,
                    width: 350,
                    height: 300,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(subjects[index].title),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Subject'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/add.png'),
                    SizedBox(height: 8.0),
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        subjects.add(Subject(_titleController.text,
                            'assets/images/placeholder.png'));
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

class Subject {
  final String title;
  final String image;

  Subject(this.title, this.image);
}

class InfoPage extends StatelessWidget {
  final Subject subject;

  const InfoPage({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(subject.image),
            const SizedBox(height: 8.0),
            Text(subject.title),
          ],
        ),
      ),
    );
  }
}
