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
          Map<String, dynamic> dataHomeStatistics = {};
          Map<String, dynamic> dataAwayStatistics = {};
          final dataMatch = ref.watch(matchDataNotifier);
          if (dataMatch.homeTeam!['team_id'] ==
              dataMatch.matchStatistic![0]['team_id']) {
            dataHomeStatistics = dataMatch.matchStatistic![0];
            dataAwayStatistics = dataMatch.matchStatistic![1];
          } else if (dataMatch.homeTeam!['team_id'] ==
              dataMatch.matchStatistic![1]['team_id']) {
            dataHomeStatistics = dataMatch.matchStatistic![1];
            dataAwayStatistics = dataMatch.matchStatistic![0];
          }

          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            statisticResult(
                statisticType: 'Ball Possession %',
                valueTeamHome: dataHomeStatistics['possessionpercent'],
                valueTeamAway: dataAwayStatistics['possessionpercent']),
            statisticResult(
                statisticType: 'Fouls',
                valueTeamHome: dataHomeStatistics['fouls'],
                valueTeamAway: dataAwayStatistics['fouls']),
            statisticResult(
                statisticType: 'injuries',
                valueTeamHome: dataHomeStatistics['injuries'],
                valueTeamAway: dataAwayStatistics['injuries']),
            statisticResult(
                statisticType: 'Corners',
                valueTeamHome: dataHomeStatistics['corners'],
                valueTeamAway: dataAwayStatistics['corners']),
            statisticResult(
                statisticType: 'Offsides',
                valueTeamHome: dataHomeStatistics['offsides'],
                valueTeamAway: dataAwayStatistics['offsides']),
            statisticResult(
                statisticType: 'Shots Total',
                valueTeamHome: dataHomeStatistics['shots_total'],
                valueTeamAway: dataAwayStatistics['shots_total']),
            statisticResult(
                statisticType: 'Shots on Target',
                valueTeamHome: dataHomeStatistics['shots_on_target'],
                valueTeamAway: dataAwayStatistics['shots_on_target']),
            statisticResult(
                statisticType: 'statisticType',
                valueTeamHome: dataHomeStatistics['shots_off_target'],
                valueTeamAway: dataAwayStatistics['shots_off_target']),
            statisticResult(
                statisticType: 'Shots Blocked',
                valueTeamHome: dataHomeStatistics['shots_blocked'],
                valueTeamAway: dataAwayStatistics['shots_blocked']),
            statisticResult(
                statisticType: 'Possession Time',
                valueTeamHome: dataHomeStatistics['possessiontime'],
                valueTeamAway: dataAwayStatistics['possessiontime']),
            statisticResult(
                statisticType: 'Yellow Cards',
                valueTeamHome: dataHomeStatistics['yellowcards'],
                valueTeamAway: dataAwayStatistics['yellowcards']),
            statisticResult(
                statisticType: 'Red Cards',
                valueTeamHome: dataHomeStatistics['redcards'],
                valueTeamAway: dataAwayStatistics['redcards']),
            statisticResult(
                statisticType: 'Substitutions',
                valueTeamHome: dataHomeStatistics['substitutions'],
                valueTeamAway: dataAwayStatistics['substitutions']),
            statisticResult(
                statisticType: 'Goal Kick',
                valueTeamHome: dataHomeStatistics['goal_kick'],
                valueTeamAway: dataAwayStatistics['goal_kick']),
            statisticResult(
                statisticType: 'Goal Attempts',
                valueTeamHome: dataHomeStatistics['goal_attempts'],
                valueTeamAway: dataAwayStatistics['goal_attempts']),
            statisticResult(
                statisticType: 'Free Kick',
                valueTeamHome: dataHomeStatistics['free_kick'],
                valueTeamAway: dataAwayStatistics['free_kick']),
            statisticResult(
                statisticType: 'Throw In',
                valueTeamHome: dataHomeStatistics['throw_in'],
                valueTeamAway: dataAwayStatistics['throw_in']),
            statisticResult(
                statisticType: 'Ball Safe',
                valueTeamHome: dataHomeStatistics['ball_safe'],
                valueTeamAway: dataAwayStatistics['ball_safe']),
            statisticResult(
                statisticType: 'Goals',
                valueTeamHome: dataHomeStatistics['goals'],
                valueTeamAway: dataAwayStatistics['goals']),
            statisticResult(
                statisticType: 'Penalties',
                valueTeamHome: dataHomeStatistics['penalties'],
                valueTeamAway: dataAwayStatistics['penalties']),
            statisticResult(
                statisticType: 'Attacks',
                valueTeamHome: dataHomeStatistics['attacks'],
                valueTeamAway: dataAwayStatistics['attacks']),
            statisticResult(
                statisticType: 'Dangerous Attacks',
                valueTeamHome: dataHomeStatistics['dangerous_attacks'],
                valueTeamAway: dataAwayStatistics['dangerous_attacks']),
          ]);
        },
      ),
    );
  }

  Widget statisticResult(
      {required String statisticType,
      required int valueTeamHome,
      required int valueTeamAway}) {
    double homePercent = valueTeamHome /
        (valueTeamHome + valueTeamAway == 0
            ? 1
            : valueTeamHome + valueTeamAway);
    double awayPercent = valueTeamAway /
        (valueTeamHome + valueTeamAway == 0
            ? 1
            : valueTeamHome + valueTeamAway);

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
