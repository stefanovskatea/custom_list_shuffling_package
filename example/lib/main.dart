import 'package:flutter/material.dart';
import 'package:custom_list_shuffling/custom_list_shuffling.dart';

void main() {
  runApp(const MyApp());
}

List<dynamic> dummyData = [
  {'name': 'Tea', 'random': false},
  {'name': 'Ana', 'random': false},
  {'name': 'Holy', 'random': true},
  {'name': 'Tom', 'random': true},
  {'name': 'Cindy', 'random': true},
  {'name': 'Aaron', 'random': true},
  {'name': 'Peter', 'random': false},
  {'name': 'Paul', 'random': false},
  {'name': 'Zara', 'random': true},
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroupedListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GroupedListView Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    dummyData.shuffleElements((element) => (element['random']));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '${dummyData[index]['name']}  randomFlag: - ${dummyData[index]['random']}'),
              ),
            );
          }),
    );
  }
}