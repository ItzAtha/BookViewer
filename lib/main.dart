import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BookListScreen(),
  ));
}

class BookListScreen extends StatelessWidget {
  BookListScreen({super.key});

  final List<Map<String, String>> books = [
    {
      "title": "Invent Your Own Computer Games with Python",
      "author": "Al Sweigart",
      "description": "This book is well-liked because it teaches the basics of "
          "Python programming with a fun approach: creating games. You will be "
          "taught basic logic concepts while programming games such as Tic-Tac-Toe, "
          "Hangman, and graphic games.",
      "filename": "inventwithpython.pdf"
    },
    {
      "title": "Eloquent JavaScript: A Modern Introduction to Programming",
      "author": "Marijn Haverbeke",
      "description": "One of the \"Holy Books\" or web developers. This book "
          "covers JavaScript in depth from the basics of syntax, data structure, "
          "to advanced features such as asynchrony (Promise) and direct interaction "
          "with the browser interface (DOM).",
      "filename": "Eloquent_JavaScript_small.pdf"
    },
    {
      "title": "Python for Everybody: Exploring Data Using Python 3",
      "author": "Dr. Charles R. Severance",
      "description": "Written by a prominent professor from the University of "
          "Michigan, this book is very practical for beginners. His main focus is "
          "on using Python to solve real problems such as reading files, doing web "
          "scraping, and interacting with SQL databases.",
      "filename": "pythonlearn.pdf"
    },
    {
      "title": "Introduction to Programming Using Java",
      "author": "David J. Eck",
      "description": "A comprehensive university-level textbook that covers Java "
          "thoroughly. It's perfect if you want a strong Object-Oriented Programming "
          "(OOP) foundation, algorithm structure, and how to create a user interface (GUI).",
      "filename": "javanotes9.pdf"
    },
    {
      "title": "Think Python: How to Think Like a Computer Scientist",
      "author": "Allen B. Downey",
      "description": "This book focuses on problem solving techniques. Instead "
          "of just memorizing code, Allen Downey will guide you to structure "
          "logical thinking like a computer scientist.",
      "filename": "thinkpython2.pdf"
    },
    {
      "title": "The React Handbook",
      "author": "Flavio Copes",
      "description": "The book was written by renowned instructor and developer, "
          "Flavio Copes. He uses the \"80/20\" rule approach, which is to teach "
          "80% of the most crucial concepts in React in 20% of your learning time. "
          "It's perfect for mastering the core of Components, JSX, State, and "
          "Props without long-winded theory.",
      "filename": "react-handbook.pdf"
    },
    {
      "title": "Beej's Guide to Network Programming",
      "author": "Brian \"Beej\" Hall",
      "description": "An iconic guide for anyone who wants to understand how the "
          "internet works behind the scenes. Using the C language, \"Beej\" "
          "explains how Socket, Client-Server, and network traffic work in a "
          "humorous and easy-to-understand language style.",
      "filename": "bgnet_usl_c_1.pdf"
    },
    {
      "title": "Flutter Complete Reference",
      "author": "Alberto Miola",
      "description": "A very thick and comprehensive main reference for anyone "
          "who wants to get serious in multi-platform application development "
          "(Android, iOS, and Web). This book dissects everything from the Dart "
          "programming language from scratch, the fundamental elements of widgets "
          "in Flutter, to the advanced level of application architecture.",
      "filename": "Flutter_Complete_Reference.pdf"
    },
    {
      "title": "Computer Science from the Bottom Up",
      "author": "Ian Wienand",
      "description": "If you already know a little bit about coding but want to "
          "know how your code is executed by machines, this is the book for you. "
          "This book bridges programming code with Operating Systems, CPU "
          "Architecture, and Memory Management.",
      "filename": "csbu.pdf"
    },
    {
      "title": "Learning React: Functional Web Development with React and Redux",
      "author": "Alex Banks & Eve Porcello",
      "description": "A book that not only focuses on the React framework itself, "
          "but also embeds the Functional Programming pattern in JavaScript. This "
          "book will guide you on how to best build a User Interface (UI) that is "
          "modular, easy to maintain, and manages data in large-scale applications.",
      "filename": "learningreact.pdf"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List'), centerTitle: true),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]['title']!),
            subtitle: Text(books[index]['author']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                    title: books[index]['title']!,
                    author: books[index]['author']!,
                    description: books[index]['description']!,
                    filename: books[index]['filename']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String filename;

  const BookDetailScreen(
      {super.key,
      required this.title,
      required this.author,
      required this.description,
      required this.filename});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Book Detail"),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $title',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('Author: $author',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade600)),
            SizedBox(height: 24),
            Text('Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadingBookFile(
                          bookPath: filename,
                        ),
                      ),
                    );
                  },
                  child: Text('Read the book'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ReadingBookFile extends StatelessWidget {
  final String bookPath;

  const ReadingBookFile({super.key, required this.bookPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reading Book File"), centerTitle: true),
      body: Center(
        child: SfPdfViewer.asset('assets/pdf/$bookPath'),
      ),
    );
  }
}
