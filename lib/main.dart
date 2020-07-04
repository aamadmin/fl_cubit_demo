import 'package:fl_cubit_demo/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CubitProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Counter')),
      body: CubitBuilder<CounterCubit, int>(
        builder: (_, count) {
          return Center(
            child: Text('$count', style: Theme.of(context).textTheme.headline1),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: context.cubit<CounterCubit>().increment,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: context.cubit<CounterCubit>().decrement,
            ),
          ),
        ],
      ),
    );
  }
}
