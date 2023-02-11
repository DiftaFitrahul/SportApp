import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/provider/provider.dart';

class TimeLine extends ConsumerWidget {
  final Map<String, dynamic> timeLine;
  const TimeLine({super.key, required this.timeLine});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataMatch = ref.watch(matchDataNotifier);
    return displayTimeline(timeLine, dataMatch);
  }

  Widget displayTimeline(timeLine, dataMatch) {
    if (timeLine['type'] == 'substitution') {
      return subtitution(
        homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0,
      );
    } else if (timeLine['type'] == 'goal') {
      return goal(
        homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0,
      );
    }
    if (timeLine['type'] == 'yellowcard') {
      return yellowCard(
        homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0,
      );
    }
    if (timeLine['type'] == 'injury') {
      return injury(
        homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0,
      );
    }
    if (timeLine['type'] == 'back from injury') {
      return backFromInjury(
        homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0,
      );
    } else {
      return const Text('No Data');
    }
  }

  Widget goal({required int homeTeamId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (timeLine['team_id'] == homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.center,
          width: 22,
          height: 22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.blue[700]),
          child: Text(
            "${timeLine['minute']}'",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ),
        (timeLine['team_id'] != homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
      ],
    );
  }

  Widget yellowCard({required int homeTeamId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (timeLine['team_id'] == homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.center,
          width: 22,
          height: 22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.blue[700]),
          child: Text(
            "${timeLine['minute']}'",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ),
        (timeLine['team_id'] != homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
      ],
    );
  }

  Widget injury({required int homeTeamId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (timeLine['team_id'] == homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.center,
          width: 22,
          height: 22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.blue[700]),
          child: Text(
            "${timeLine['minute']}'",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ),
        (timeLine['team_id'] != homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
      ],
    );
  }

  Widget backFromInjury({required int homeTeamId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (timeLine['team_id'] == homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.center,
          width: 22,
          height: 22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.blue[700]),
          child: Text(
            "${timeLine['minute']}'",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ),
        (timeLine['team_id'] != homeTeamId)
            ? Flexible(
                child: Container(
                alignment: Alignment.centerLeft,
                height: 23,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    timeLine['player_name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ))
            : const Flexible(
                child: SizedBox(
                width: double.infinity,
              )),
      ],
    );
  }

  Widget subtitution({
    required int homeTeamId,
  }) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (timeLine['team_id'] == homeTeamId)
              ? Flexible(
                  child: Column(
                    children: [
                      Flexible(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        height: 23,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            timeLine['player_name'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 4,
                      ),
                      Flexible(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        height: 23,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            timeLine['related_player_name'],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        ),
                      )),
                    ],
                  ),
                )
              : const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            alignment: Alignment.center,
            width: 22,
            height: 22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[700]),
            child: Text(
              "${timeLine['minute']}'",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            ),
          ),
          (timeLine['team_id'] == homeTeamId)
              ? const Flexible(
                  child: SizedBox(
                  width: double.infinity,
                ))
              : Flexible(
                  child: Column(
                    children: [
                      Flexible(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        height: 23,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            timeLine['player_name'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 4,
                      ),
                      Flexible(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        height: 23,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            timeLine['related_player_name'],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
