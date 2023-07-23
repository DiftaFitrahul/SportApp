import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LineStatsAnimation extends StatelessWidget {
  final double percent;
  final Color barColor;

  const LineStatsAnimation({super.key, required this.percent, required this.barColor,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LinearPercentIndicator(
          padding: const EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width / 5,
          animation: true,
          lineHeight: 5.0,
          animationDuration: 1000,
          percent: (percent < 0.0 || percent > 1.0) ? 0.0 : percent,
          progressColor: barColor,
          alignment: MainAxisAlignment.spaceBetween,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
