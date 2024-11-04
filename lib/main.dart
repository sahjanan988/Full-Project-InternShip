import 'package:flutter/material.dart';
import 'animal_example.dart'; // Assuming animal classes defined here
import 'package:firebase_core/firebase_core.dart';

// Custom AnimalCard widget
class AnimalCard extends StatelessWidget {
  final Animal animal;
  const AnimalCard(Key? key, this.animal) : super(key: key);
}
class DetailScreen extends StatelessWidget {
  final Animal animal;

  const DetailScreen({Key? key, required this.animal}) : super(key: key);

void main() async {
   WidgetsFlutterBinding.ensureInitialized(); 

   await Firebase.initializeApp(); 
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(args.toString()), 

      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Card(
    child: ListTile(
      title: Text(
          animal.runtimeType.toString().substring(6)), // Extract animal type
      subtitle: Text(animal.makeSound()),
    ),
  );
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
      home: const MyHomePage(title: 'Flutter Demo  Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  void navigateToDetailScreen(Animal animal) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailScreen(animal: animal),
    ),
  );
}
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  Navigator.pushNamed(context, '/second', arguments: 'Hello from FirstScreen');
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Animal> animals = [Dog(), Cat()]; // List of animal instances

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary, // Use theme color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Display animal list using ListView.builder
            ListView.builder(
              shrinkWrap: true, // Adjust list height as needed
              itemCount: animals.length,
              itemBuilder: (context, index) {
                return AnimalCard(animal: animals[index]);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
