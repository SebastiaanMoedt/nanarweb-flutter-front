import 'package:flutter/material.dart';

import '../class/Cycle.dart';
import '../partials/nanar_appbar.dart';
import '../partials/nanar_bottomnavbar.dart';

class CycleDetail extends StatelessWidget {
  final Cycle cycle;
  const CycleDetail({super.key, required this.cycle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NanarAppbar(
        title: '${cycle.name} - détails',
        actions: [IconButton(icon: Icon(Icons.edit), onPressed: () {})],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: cycle.filmsToWatch.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 25,
              shadowColor: Theme.of(context).colorScheme.tertiary,
              color: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                title: Text(cycle.filmsToWatch[index].title),
                subtitle: Text(cycle.filmsToWatch[index].year.toString()),
                onTap: () {},
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: NanarBottomNavBar(),
    );
  }
}
