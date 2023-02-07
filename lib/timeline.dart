import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  final List timeLine;
  final int number;
  const TimeLine({super.key, required this.timeLine, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Column(children: []),
      ),
    );
  }
}
