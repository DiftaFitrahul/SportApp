import 'package:flutter/material.dart';
import 'package:sportapp/Stats.dart';
import 'package:sportapp/lineup.dart';
import './model/matchTeams.dart';
import 'package:sportapp/model/standing_league.dart';
import 'package:sportapp/service/FetchData/fd_standingleaguebyid.dart';
import 'package:sportapp/standings.dart';
import 'package:sportapp/result.dart';
import 'package:sportapp/timeline.dart';

import 'service/FetchData/fd_matchbyid.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  bool statisticsIsPressed = true;
  bool timelineIsPressed = false;
  bool lineupsIsPressed = false;
  bool rankingIsPressed = false;
 
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      body: FutureBuilder(
        future: FetchDataMatch.fetchData("325104"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: const Color.fromARGB(255, 229, 233, 236),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 60,
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.density_medium,
                            ),
                            color: Colors.white,
                            onPressed: () {},
                          ),
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
                                      : const TextStyle(color: Colors.white60),
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
                          color: Colors.blueAccent[700], child: const Result()),
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
                              color: const Color.fromARGB(255, 229, 233, 236)),
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
                      return (rankingIsPressed) ? standings() : statisticText();
                    },
                  )),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: (rankingIsPressed) ? 1 : 1,
                          (_, index) => (rankingIsPressed)
                              ? const Statistics()
                              : TimeLine(
                                  timeLine: snapshot.data!.matchEvent!,
                                  number: 1,
                                )))
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          }
          return const CircularProgressIndicator();
        },
      ),
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
}
