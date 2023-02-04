import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "LaLiga",
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
                  "https://cdn.sportdataapi.com/images/soccer/teams/100/113.png",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Real Madrid",
                  style: TextStyle(
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
                const Text(
                  "90",
                  style: TextStyle(color: Colors.white60, fontSize: 20),
                ),
                Row(
                  children: const [
                    Text("2 : ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Text("3",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
            Column(
              children: [
                Image.network(
                  "https://cdn.sportdataapi.com/images/soccer/teams/100/99.png",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "FC Barcelona",
                  style: TextStyle(
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
