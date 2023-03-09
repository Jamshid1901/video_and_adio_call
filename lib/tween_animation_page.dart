import 'package:flutter/material.dart';

class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({Key? key}) : super(key: key);

  @override
  State<TweenAnimationPage> createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage> {
  double targetValue = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double size, Widget? model) {
            return TextButton(
              child: Text(
                "Text",
                style: TextStyle(fontSize: size),
              ),
              onPressed: () {
                targetValue = ((targetValue == 48.0) ? 96.0 : 48.0);
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
