import 'package:flutter/material.dart';
import 'package:provider/change_notifier.dart'; // Import ChangeNotifier

// Custom AnimalCard widget (assuming animal classes defined elsewhere)
class AnimalCard extends StatelessWidget {
  final Animal animal;
  const AnimalCard({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(   

      child: ListTile(
        title: Text(animal.runtimeType.toString().substring(6)), // Extract animal type
        subtitle: Text(animal.makeSound()),
      ),
    );
  }
}

// Corrected Counter class with ChangeNotifier
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notify listeners  of the change
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<Counter>( 
        create: (context) => Counter(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,
 required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Animal> animals = [Dog(), Cat()];
  final Counter _counter = Counter(); // Create a Counter instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'), 

            
            // Access _counter using Provider.of
            Text(Provider.of<Counter>(context).count.toString(), // Get count value
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Use _counter.increment() to access increment method
            FloatingActionButton(
              onPressed: () => _counter.increment(), // Use _counter instance
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}