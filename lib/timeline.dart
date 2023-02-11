import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Widget/timeline-widget.dart';

class TimeLinePage extends StatelessWidget {
  final List timeLine;
  final int number;
  const TimeLinePage({super.key, required this.timeLine, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: TimeLine(timeLine: timeLine[number]));
  }
}
