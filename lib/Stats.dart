import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/line_stats.dart';

import 'package:sportapp/line_stats.dart';
import 'package:sportapp/provider/provider.dart';
import 'package:sportapp/service/FetchData/fd_matchbyid.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 8),
      child: Consumer(
        builder: (context, ref, child) {
          final dataStatistic = ref.watch(matchDataNotifier);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              statisticResult(
                  statisticType: "Fouls",
                  valueTeamHome: dataStatistic.matchStatistic![0]['fouls'],
                  valueTeamAway: dataStatistic.matchStatistic![1]['fouls'])
            ],
          );
        },
      ),
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
