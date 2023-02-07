import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TimeLine extends StatelessWidget {
  final int teamID;
  final String type;
  final String playerName;
  final String? relatedPlayerName;
  final int minute;
  const TimeLine(
      {super.key,
      required this.type,
      required this.teamID,
      required this.minute,
      required this.playerName,
      this.relatedPlayerName});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget timelineSubtitution(
      {required int teamId,
      required String playerInName,
      required String playerOutName,
      required int minute}) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (teamID == 6402)
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
                            playerInName,
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
                            playerOutName,
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
              minute.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          (teamID == 6402)
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
                            playerInName,
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
                            playerOutName,
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
