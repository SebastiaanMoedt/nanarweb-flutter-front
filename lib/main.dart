import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nanarweb_front/pages/CycleDetail.dart';
import 'package:nanarweb_front/partials/NanarAppBar.dart';
import 'package:nanarweb_front/partials/NanarBottomNavBar.dart';

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
    Cycle(
      id: 1,
      name: 'VRROOOMMM',
      description: 'Des films de voiture',
      filmsToWatch: [
        Film(
          id: '1',
          title: 'Thelma & Louise',
          year: 1991,
          length: 130,
          filmPath: '',
          subsPath: '',
          filmState: FilmState.TO_WATCH,
          specialInfo: '',
        ),
      ],
      filmsWatched: [
        Film(
          id: '2',
          title: 'Bullitt',
          year: 1968,
          length: 113,
          filmPath: '',
          subsPath: '',
          filmState: FilmState.TO_KEEP,
          specialInfo: '',
        ),
      ],
      defaultSortType: SortType.RELEASE_YEAR,
      state: CycleState.CURRENT,
    ),
    Cycle(
      id: 2,
      name: 'Cosmic Horror',
      description: 'Des films d\'horreur cosmique.',
      filmsToWatch: [
        Film(
          id: '3',
          title: 'The Beyond',
          year: 1981,
          length: 2000,
          filmPath: '',
          subsPath: '',
          specialInfo: '',
          filmState: FilmState.TO_WATCH,
        ),
      ],
      filmsWatched: [
        Film(
          id: '4',
          title: 'Event Horizon',
          year: 1997,
          length: 2000,
          filmPath: '',
          subsPath: '',
          specialInfo: '',
          filmState: FilmState.TO_KEEP,
        ),
      ],
      defaultSortType: SortType.RELEASE_YEAR,
      state: CycleState.READY,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NanarAppbar(title: widget.title, actions: []),
      body: Container(
        padding: EdgeInsets.all(30),
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
