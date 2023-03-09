import 'package:flutter/material.dart';

class AnimationUiPage extends StatefulWidget {
  const AnimationUiPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimationUiPage> createState() => _AnimationUiPageState();
}

class _AnimationUiPageState extends State<AnimationUiPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 120,
      vsync: this,
      duration: const Duration(
        minutes: 2,
      ),
    );
    _controller.reset();
    _controller.addListener(() {
      setState(() {});

      // print("millisecund : ${_controller.value % 60}");
      // print(
      //     "timer : ${(_controller.value / 60).floor().toString().padLeft(2, "0")} || ${(_controller.value % 60).floor().toString().padLeft(2, "0")}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: Center(
            child: Text(
              "${(_controller.value / 60).floor().toString().padLeft(2, "0")} : ${(_controller.value % 60).floor().toString().padLeft(2, "0")}",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.value == 0
                  ? _controller.forward()
                  : _controller.reverse();
            },
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.stop();
            },
          ),
        ],
      ),
    );
  }
}
