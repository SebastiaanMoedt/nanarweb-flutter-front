import 'package:flutter/material.dart';

import 'class/Cycle.dart';
import 'class/Film.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    primary: Colors.lightGreen,
    secondary: Colors.blue,
    tertiary: Colors.pinkAccent,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Nanarweb',
      // pour masquer le ruban DEBUG (qui montre qu'on est en dev)
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 25, color: Colors.white),
        ),
        colorScheme: colorScheme,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      home: const MyHomePage(title: 'Bienvenue sur le Nanarweb'),
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
  List<Cycle> cycles = [
    Cycle('VRROOOMMM', 'Des films de voiture', [
      Film('Bullitt', 1968),
      Film('Thelma & Louise', 1991),
    ]),
    Cycle('Cosmic Horror', 'Des films d\'horreur cosmique.', [
      Film('The Beyond', 1981),
      Film('Event Horizon', 1997),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Image(
          image: AssetImage('assets/House.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: ListView.builder(
            itemCount: cycles.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 45,
                shadowColor: Theme.of(context).colorScheme.tertiary,
                color: Theme.of(context).colorScheme.secondary,
                child: ListTile(
                  title: Text(cycles[index].name),
                  subtitle: Text(cycles[index].description),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Consulter Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Ajouter Cycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Ajouter Film',
          ),
        ],
        selectedItemColor: Colors.pink[800],
      ),
    );
  }
}
