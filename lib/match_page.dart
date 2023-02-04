import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:sportapp/Stats.dart';
import 'package:sportapp/result.dart';
import 'package:sportapp/timeline.dart';

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
      body: Container(
        color: Colors.white,
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
                                  : const TextStyle(color: Colors.white60),
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
                                  : const TextStyle(color: Colors.white60),
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
                                  : const TextStyle(color: Colors.white60),
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
                    border: Border.all(width: 0, color: Colors.white),
                    color: Colors.white,
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
                    childCount: 1, (_, __) => const TimeLine()))
          ],
        ),
      ),
    );
  }
}
