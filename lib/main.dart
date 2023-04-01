import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

class MonarchListWidget extends StatefulWidget {
  final ListState state;
  final List<Map<String, dynamic>> list;

  const MonarchListWidget({Key? key, required this.state, required this.list})
      : super(key: key);

  @override
  State<MonarchListWidget> createState() => _MonarchListWidgetState();
}

class _MonarchListWidgetState extends State<MonarchListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state == ListState.success) {
      return ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.list[index]["title"],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(widget.list[index]["subtitle"], style: Theme.of(context).textTheme.bodyMedium),
                  ]),
            );
          });
    } else if (widget.state == ListState.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.state == ListState.empty) {
      return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Icon(Icons.list_alt, size: 100, color: Colors.grey),
            Text("There are no items in this list",
                style: Theme.of(context).textTheme.bodyMedium),
          ]));
    } else {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.error_outline, size: 100, color: Colors.red),
              Text("There was an error loading this list",
                  style: TextStyle(fontSize: 16)),
            ]),
      );
    }
  }
}

enum ListState { success, loading, empty, error }
