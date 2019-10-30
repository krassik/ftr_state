import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:bloc/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ValueNotifier<int>>(
          builder: (context) => ValueNotifier<int>(0), // initial value
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ValueNotifier<int>>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<ValueNotifier<int>>(
                    builder: (_, counter, __) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => counter.value++,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => counter.value--,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
