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
    return timelineSubtitution(
      homeTeamId: dataMatch.homeTeam?['team_id'] ?? 0,
    );
  }

  Widget timelineSubtitution({
    required int homeTeamId,
  }) {
    print(timeLine['team_id']);
    print(homeTeamId);

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
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            timeLine['player_name'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 4,
                      ),
                      Flexible(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            timeLine['related_player_name'],
                            style: const TextStyle(color: Colors.black),
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
            width: 27,
            height: 27,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.blue),
            child: Text(
              timeLine['minute'].toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
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
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            timeLine['player_name'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 4,
                      ),
                      Flexible(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            timeLine['related_player_name'],
                            style: const TextStyle(color: Colors.black),
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
