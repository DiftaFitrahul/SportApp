import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/model/matchTeams.dart';
import 'package:sportapp/model/standing_league.dart';
import 'package:sportapp/model/tabBarSelection.dart';
import 'package:sportapp/page/Stats.dart';
import 'package:sportapp/page/lineup.dart';
import 'package:sportapp/page/result.dart';
import 'package:sportapp/page/standings.dart';
import 'package:sportapp/page/timeline.dart';
import 'package:sportapp/provider/provider.dart';

class MatchPage extends ConsumerWidget {
  static const routeName = '/matchPge';
  MatchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticsIsPressed =
        ref.watch(tabBarDataNotifier).statisticsIsPressed;
    final timelineIsPressed = ref.watch(tabBarDataNotifier).timelineIsPressed;
    final lineupsIsPressed = ref.watch(tabBarDataNotifier).lineupsIsPressed;
    final rankingIsPressed = ref.watch(tabBarDataNotifier).rankingIsPressed;

    double height = MediaQuery.of(context).size.height * 0.45;
    final dataMatch = ref.watch(matchDataNotifier);
    return ref.watch(dataStandingsProvider(dataMatch.seasonId.toString())).when(
      data: (standingLeague) {
        return Scaffold(
            body: Container(
                color: const Color.fromARGB(255, 229, 233, 236),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      toolbarHeight: 60,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.sports_volleyball_sharp),
                                Text(
                                  "posever",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.account_circle_outlined,
                                  size: 30,
                                ))
                          ]),
                      bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      ref
                                          .read(tabBarDataNotifier.notifier)
                                          .updateStatisticPressed();
                                    },
                                    child: Text(
                                      "Statistics",
                                      style: statisticsIsPressed
                                          ? const TextStyle(color: Colors.white)
                                          : const TextStyle(
                                              color: Colors.white60),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      ref
                                          .read(tabBarDataNotifier.notifier)
                                          .updateTimelinePressed();
                                    },
                                    child: Text(
                                      "Timeline",
                                      style: timelineIsPressed
                                          ? const TextStyle(color: Colors.white)
                                          : const TextStyle(
                                              color: Colors.white60),
                                    )),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(tabBarDataNotifier.notifier)
                                        .updateLineupPressed();
                                  },
                                  child: Text(
                                    "Lineups",
                                    style: lineupsIsPressed
                                        ? const TextStyle(color: Colors.white)
                                        : const TextStyle(
                                            color: Colors.white60),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      ref
                                          .read(tabBarDataNotifier.notifier)
                                          .updateRankingPressed();
                                    },
                                    child: Text(
                                      "Ranking",
                                      style: rankingIsPressed
                                          ? const TextStyle(color: Colors.white)
                                          : const TextStyle(
                                              color: Colors.white60),
                                    )),
                              ],
                            ),
                          )),
                      pinned: true,
                      expandedHeight: height,
                      backgroundColor: Colors.blueAccent[700],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                            color: Colors.blueAccent[700],
                            child: const Result()),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.blueAccent[700],
                        height: 20,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0,
                                color:
                                    const Color.fromARGB(255, 229, 233, 236)),
                            color: const Color.fromARGB(255, 229, 233, 236),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (context, index) {
                        return getTitleSliver(
                            ref.watch(tabBarDataNotifier), dataMatch);
                      },
                    )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: getDataLength(
                                ref.watch(tabBarDataNotifier),
                                dataMatch,
                                standingLeague),
                            (_, index) => getDataSliver(
                                ref.watch(tabBarDataNotifier),
                                dataMatch,
                                index,
                                standingLeague))),
                  ],
                )));
      },
      error: (error, stackTrace) {
        return const Scaffold(body: Center(child: Text('error')));
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget statisticAndTimelineText(MatchTeams dataMatchTeams) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dataMatchTeams.homeTeam!['name'],
            style: TextStyle(
                color: Colors.indigoAccent[700],
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          Text(
            dataMatchTeams.awayTeam!['name'],
            style: TextStyle(
                color: Colors.indigoAccent[700],
                fontWeight: FontWeight.w500,
                fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget standings() {
    return Container(
      margin: const EdgeInsets.only(
        left: 50,
        right: 10,
      ),
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      height: 30,
      child: Row(
        children: const [
          Expanded(child: Text("Teams")),
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text("Match"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text("Win"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text("Draw"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, right: 8),
            child: Text("Loss"),
          ),
        ],
      ),
    );
  }

  Widget getTitleSliver(
      TabBarSelection tabBarSelection, MatchTeams dataMatchTeams) {
    if (tabBarSelection.statisticsIsPressed == true) {
      return statisticAndTimelineText(dataMatchTeams);
    } else if (tabBarSelection.timelineIsPressed == true) {
      return statisticAndTimelineText(dataMatchTeams);
    } else if (tabBarSelection.lineupsIsPressed == true) {
      return const Text("Lineup");
    } else {
      return standings();
    }
  }

  int getDataLength(TabBarSelection tabBarSelection, MatchTeams dataMatchTeams,
      List<StandingLeague> dataLeagues) {
    if (tabBarSelection.statisticsIsPressed == true) {
      return 1;
    } else if (tabBarSelection.timelineIsPressed == true) {
      return dataMatchTeams.matchEvent!.length;
    } else if (tabBarSelection.lineupsIsPressed == true) {
      return 1;
    } else {
      return dataLeagues.length;
    }
  }

  Widget getDataSliver(TabBarSelection tabBarSelection,
      MatchTeams dataMatchTeams, int index, List<StandingLeague> dataLeagues) {
    if (tabBarSelection.statisticsIsPressed == true) {
      return const Statistics();
    } else if (tabBarSelection.timelineIsPressed == true) {
      return TimeLinePage(
          timeLines: dataMatchTeams.matchEvent ?? [], number: index);
    } else if (tabBarSelection.lineupsIsPressed == true) {
      return const LineUp();
    } else {
      return Standings(number: index, data: dataLeagues);
    }
  }
}
