import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/Stats.dart';
import 'package:sportapp/provider/provider.dart';
import 'package:sportapp/standings.dart';
import 'package:sportapp/result.dart';
import 'package:sportapp/timeline.dart';


class MatchPage extends ConsumerStatefulWidget {
  static const routeName = '/matchPge';
  const MatchPage({super.key});

  @override
  ConsumerState<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends ConsumerState<MatchPage> {
  bool statisticsIsPressed = true;
  bool timelineIsPressed = false;
  bool lineupsIsPressed = false;
  bool rankingIsPressed = false;

  @override
  Widget build(BuildContext context) {
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
                                      setState(() {
                                        statisticsIsPressed = true;
                                        timelineIsPressed = false;
                                        lineupsIsPressed = false;
                                        rankingIsPressed = false;
                                      });
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
                                      setState(() {
                                        statisticsIsPressed = false;
                                        timelineIsPressed = true;
                                        lineupsIsPressed = false;
                                        rankingIsPressed = false;
                                      });
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
                                    setState(() {
                                      statisticsIsPressed = false;
                                      timelineIsPressed = false;
                                      lineupsIsPressed = true;
                                      rankingIsPressed = false;
                                    });
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
                                      setState(() {
                                        statisticsIsPressed = false;
                                        timelineIsPressed = false;
                                        lineupsIsPressed = false;
                                        rankingIsPressed = true;
                                      });
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
                        return getTitleSliver();
                      },
                    )),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(childCount: (statisticsIsPressed)? 1: 2,
                            (_, index) {
                      if (statisticsIsPressed) {
                        return const Statistics();
                      } else {
                        return TimeLinePage(number: index, timeLine: dataMatch.matchEvent ?? [],);
                      }
                    })),
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

  Widget statisticText() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Real Madrid",
            style: TextStyle(
                color: Colors.indigoAccent[700],
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          Text(
            "FC Barcelona",
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

  Widget getTitleSliver() {
    if (statisticsIsPressed == true) {
      return statisticText();
    } else if (timelineIsPressed == true) {
      return const Text("TimeLIne");
    } else if (lineupsIsPressed == true) {
      return const Text("Lineup");
    } else {
      return standings();
    }
  }
}
