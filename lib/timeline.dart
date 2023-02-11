import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Widget/timeline-widget.dart';

class TimeLinePage extends StatelessWidget {
  final List timeLine;
  final int number;
  const TimeLinePage({super.key, required this.timeLine, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: timelineData()),
    );
  }

  Widget timelineData() {
    if (timeLine[number]['type'] == 'substitution') {
      print(timeLine[number]['type']);
      return TimeLine(timeLine: timeLine[number]);
    } else {
      print(timeLine[number]['type']);
      return const Text('halo');
    }
  }
}
