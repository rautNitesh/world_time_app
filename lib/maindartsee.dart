import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Nitesh Raut',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getData() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/todos/1');
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<String> about = [
    'The name of my village is Kesharbag',
    'I live in a country of Nepal',
    'We are all NEpali'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: about
                  .map((ab) => Text(
                        ab,
                        style: TextStyle(color: Colors.white),
                      ))
                  .toList()),
        ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
          Text(
            pair.asPascalCase,
            style: _biggerFont,
          )
        ]));
  }
}
