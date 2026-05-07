import 'package:flutter/material.dart';

import '../class/Cycle.dart';

class CycleDetail extends StatelessWidget {
  final Cycle cycle;
  const CycleDetail({super.key, required this.cycle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${cycle.name} - détails'),
        flexibleSpace: Image(
          image: AssetImage('assets/House.jpg'),
          fit: BoxFit.cover,
        ),
        actions: [IconButton(icon: Icon(Icons.edit), onPressed: () {})],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: cycle.films.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 25,
              shadowColor: Theme.of(context).colorScheme.tertiary,
              color: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                title: Text(cycle.films[index].title),
                subtitle: Text(cycle.films[index].year as String),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
