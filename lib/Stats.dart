import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sportapp/line_stats.dart';

import 'package:sportapp/line_stats.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 8),
      child: Column(children: [
        statisticResult(
          statisticType: "Ball Possession %",
          valueTeamHome: 43,
          valueTeamAway: 57,
        ),
        statisticResult(
          statisticType: "Goal Attempt",
          valueTeamHome: 8,
          valueTeamAway: 18,
        ),
        statisticResult(
          statisticType: "Shots on Goal",
          valueTeamHome: 4,
          valueTeamAway: 5,
        ),
        statisticResult(
          statisticType: "Shots off Goal",
          valueTeamHome: 2,
          valueTeamAway: 7,
        ),
        statisticResult(
          statisticType: "Blocked Shots",
          valueTeamHome: 2,
          valueTeamAway: 6,
        ),
        statisticResult(
          statisticType: "Free Kicks",
          valueTeamHome: 17,
          valueTeamAway: 14,
        ),
        statisticResult(
          statisticType: "Corner Kicks",
          valueTeamHome: 2,
          valueTeamAway: 3,
        ),
        statisticResult(
          statisticType: "Offsides",
          valueTeamHome: 3,
          valueTeamAway: 4,
        ),
        statisticResult(
          statisticType: "Throw-in",
          valueTeamHome: 17,
          valueTeamAway: 15,
        ),
        statisticResult(
          statisticType: "Goalkeeper Saves",
          valueTeamHome: 4,
          valueTeamAway: 1,
        ),
        statisticResult(
          statisticType: "Fouls",
          valueTeamHome: 11,
          valueTeamAway: 14,
        ),
        statisticResult(
          statisticType: "Yellow Cards",
          valueTeamHome: 2,
          valueTeamAway: 2,
        ),
        statisticResult(
          statisticType: "Total Passes",
          valueTeamHome: 414,
          valueTeamAway: 547,
        ),
        statisticResult(
          statisticType: "Completed Passes",
          valueTeamHome: 345,
          valueTeamAway: 488,
        ),
        statisticResult(
          statisticType: "Tackles",
          valueTeamHome: 19,
          valueTeamAway: 14,
        ),
        statisticResult(
          statisticType: "Attacks",
          valueTeamHome: 79,
          valueTeamAway: 124,
        ),
        statisticResult(
          statisticType: "Dangerous Attacks",
          valueTeamHome: 36,
          valueTeamAway: 55,
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }

  Widget statisticResult(
      {required String statisticType,
      required int valueTeamHome,
      required int valueTeamAway}) {
    double homePercent = valueTeamHome / (valueTeamHome + valueTeamAway);
    double awayPercent = valueTeamAway / (valueTeamHome + valueTeamAway);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                ),
                alignment: Alignment.center,
                width: 25,
                color: Colors.white,
                child: Text(
                  valueTeamHome.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 10),
                ),
              ),
              LineStatsAnimation(
                percent: homePercent,
                barColor: Colors.blue,
              ),
            ],
          ),
          Text(statisticType),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RotatedBox(
                  quarterTurns: 2,
                  child: LineStatsAnimation(
                      percent: awayPercent, barColor: Colors.red)),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                ),
                alignment: Alignment.center,
                width: 25,
                color: Colors.white,
                child: Text(
                  valueTeamAway.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
