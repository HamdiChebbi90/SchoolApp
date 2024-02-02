import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();

    books.add(Book('Book 1', 'Author 1', 'assets/images/book1.jpg'));
    books.add(Book('Book 2', 'Author 2', 'assets/images/book2.jpg'));
    books.add(Book('Book 3', 'Author 3', 'assets/images/book3.jpg'));
    books.add(Book('Book 4', 'Author 4', 'assets/images/book4.jpg'));
    books.add(Book('Book 5', 'Author 5', 'assets/images/book5.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookPage(book: books[index])),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              child: Card(
                shadowColor: Colors.black,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(books[index].image, width: 100, height: 100),
                    const SizedBox(height: 8.0),
                    Text(books[index].title),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String image;

  Book(this.title, this.author, this.image);
}

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(book.image),
            const SizedBox(height: 8.0),
            Text(book.title),
            const SizedBox(height: 8.0),
            Text(book.author),
          ],
        ),
      ),
    );
  }
}
