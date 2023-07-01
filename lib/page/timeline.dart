import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

import '../provider/provider.dart';

class TimeLinePage extends ConsumerWidget {
  final List timeLines;
  final int number;

  const TimeLinePage({
    super.key,
    required this.timeLines,
    required this.number,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataMatch = ref.watch(matchDataNotifier);
    final Map<String, dynamic> timeLine = timeLines[number];
    return Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: displayTimeline(
          timeLine,
          dataMatch,
        ));
  }

  Widget displayTimeline(
    timeLine,
    dataMatch,
  ) {
    if (timeLine['type'] == 'substitution') {
      return subtitution(
          homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0, timeLine: timeLine);
    } else if (timeLine['type'] == 'goal') {
      return goal(
          homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0, timeLine: timeLine);
    }
    if (timeLine['type'] == 'yellowcard') {
      return yellowCard(
          homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0, timeLine: timeLine);
    }
    if (timeLine['type'] == 'injury') {
      return injury(
          homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0, timeLine: timeLine);
    }
    if (timeLine['type'] == 'back from injury') {
      return backFromInjury(
          homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0, timeLine: timeLine);
    } else {
      return const Text('No Data');
    }
  }

  Widget goal(
      {required int homeTeamId, required Map<String, dynamic> timeLine}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (timeLine['team_id'] == homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.greenAccent[400]!,
                  const Icon(
                    Icons.sports_soccer,
                    size: 15,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
          minuteWidget(timeLine['minute']),
          (timeLine['team_id'] != homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.greenAccent[400]!,
                  const Icon(
                    Icons.sports_soccer,
                    size: 15,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
        ],
      ),
    );
  }

  Widget yellowCard(
      {required int homeTeamId, required Map<String, dynamic> timeLine}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (timeLine['team_id'] == homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.orange,
                  const Icon(
                    Icons.priority_high_sharp,
                    size: 14,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
          minuteWidget(timeLine['minute']),
          (timeLine['team_id'] != homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.orange,
                  const Icon(
                    Icons.priority_high_sharp,
                    size: 14,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
        ],
      ),
    );
  }

  Widget injury(
      {required int homeTeamId, required Map<String, dynamic> timeLine}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (timeLine['team_id'] == homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.red,
                  const Icon(
                    Icons.personal_injury,
                    size: 15,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
          minuteWidget(timeLine['minute']),
          (timeLine['team_id'] != homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.red,
                  const Icon(
                    Icons.personal_injury,
                    size: 15,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
        ],
      ),
    );
  }

  Widget backFromInjury(
      {required int homeTeamId, required Map<String, dynamic> timeLine}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (timeLine['team_id'] == homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.purple,
                  const Icon(
                    Icons.health_and_safety,
                    size: 15,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
          minuteWidget(timeLine['minute']),
          (timeLine['team_id'] != homeTeamId)
              ? timeLineWidget(
                  timeLine['player_name'],
                  Colors.purple,
                  const Icon(
                    Icons.health_and_safety,
                    size: 15,
                    color: Colors.white,
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
        ],
      ),
    );
  }

  Widget subtitution(
      {required int homeTeamId, required Map<String, dynamic> timeLine}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (timeLine['team_id'] == homeTeamId)
                ? Flexible(
                    child: Column(
                      children: [
                        timeLineWidget(
                          timeLine['player_name'],
                          Colors.blue[800]!,
                          const Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        timeLineWidget(
                          timeLine['related_player_name'],
                          Colors.grey,
                          const Icon(
                            Icons.arrow_back,
                            size: 14,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                : const Flexible(
                    child: SizedBox(
                    width: double.infinity,
                  )),
            minuteWidget(timeLine['minute']),
            (timeLine['team_id'] == homeTeamId)
                ? const Flexible(
                    child: SizedBox(
                    width: double.infinity,
                  ))
                : Flexible(
                    child: Column(
                      children: [
                        timeLineWidget(
                          timeLine['player_name'],
                          Colors.blue[800]!,
                          const Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        timeLineWidget(
                          timeLine['related_player_name'],
                          Colors.grey,
                          const Icon(
                            Icons.arrow_back,
                            size: 14,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget timeLineWidget(
    String name,
    Color color,
    Icon icon,
  ) {
    return Flexible(
        child: Container(
      height: 22,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 122, 122, 122).withOpacity(0.4),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3))
      ]),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 23,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              icon
            ],
          ),
        ),
      ),
    ));
  }

  Widget minuteWidget(int minute) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 122, 122, 122).withOpacity(0.4),
            blurRadius: 3,
            spreadRadius: 2,
            offset: Offset(0, 2))
      ]),
      child: Container(
        alignment: Alignment.center,
        width: 22,
        height: 22,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.blue[700]),
        child: Text(
          "$minute'",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
        ),
      ),
    );
  }
}
