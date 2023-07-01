import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/provider/provider.dart';

class Result extends ConsumerWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchData = ref.watch(matchDataNotifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "La Liga",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.network(
                  matchData.homeTeam?['logo'] ?? '',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  matchData.homeTeam?['name'] ?? " ",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 0, 68, 255)),
                      child: const Center(
                          child: Text(
                        "L",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        "W",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        "W",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        "W",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  matchData.minute.toString(),
                  style: const TextStyle(color: Colors.white60, fontSize: 20),
                ),
                Text(matchData.goalStats?['ft_score'] ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              children: [
                Image.network(
                  matchData.awayTeam?['logo'] ?? '',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  matchData.awayTeam?['name'] ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 0, 68, 255)),
                      child: const Center(
                          child: Text(
                        "L",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        "W",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        "W",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        "W",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    )
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
