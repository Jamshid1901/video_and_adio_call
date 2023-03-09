import 'package:flutter/material.dart';

import 'animationUIPage.dart';
import 'home_page.dart';
import 'tween_animation_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: AnimationUiPage(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products'),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Draggable<int>(
                data: index,
                feedback: Container(
                  height: 100.0,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Product item : ${list[index]}',
                      style: const TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                  ),
                ),
                childWhenDragging: const SizedBox.shrink(),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.green,
                  child: Center(
                    child: Text('Product item : ${list[index]} '),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: DragTarget<int>(
        builder: (BuildContext context, List<dynamic> accepted,
            List<dynamic> rejected) {
          return Container(
            margin: const EdgeInsets.all(32),
            width: 100,
            height: 100,
            color: Colors.red,
            child: Center(child: Text("C: $acceptedData")),
          );
        },
        onAccept: (int index) {
          list.removeAt(index);
          setState(() {});
        },
      ),
    );
  }
}
