import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nanarweb_front/pages/cycle_detail.dart';
import 'package:nanarweb_front/partials/nanar_bottomnavbar.dart';

import 'class/Cycle.dart';
import 'class/Film.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(title: 'Flutter Demo Home Page'),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final cycle = state.extra as Cycle;
        return CycleDetail(cycle: cycle);
      },
    ),
  ],
);

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
    return MaterialApp.router(
      title: 'Le Nanarweb',
      // pour masquer le ruban DEBUG (qui montre qu'on est en dev)
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 25, color: Colors.white),
          titleMedium: TextStyle(fontSize: 15, color: Colors.white),
          titleSmall: TextStyle(fontSize: 12, color: Colors.white),
        ),
        colorScheme: colorScheme,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      routerConfig: _router,
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
    Cycle(1, 'VRROOOMMM', 'Des films de voiture', [
      Film('Bullitt', 1968),
      Film('Thelma & Louise', 1991),
    ]),
    Cycle(2, 'Cosmic Horror', 'Des films d\'horreur cosmique.', [
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
        child: ListView.builder(
          itemCount: cycles.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 25,
              shadowColor: Theme.of(context).colorScheme.tertiary,
              color: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                title: Text(cycles[index].name),
                subtitle: Text(cycles[index].description),
                onTap: () {
                  context.push('/detail', extra: cycles[index]);
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: NanarBottomNavBar(),
    );
  }
}
