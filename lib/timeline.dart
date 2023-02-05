import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Column(children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Lionel Messi",
                            style: TextStyle(color: Colors.white),
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Lionel Messi",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.center,
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child: const Text(
                    "12",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.center,
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child: const Text(
                    "12",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                //===========
                Flexible(
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Lionel Messi",
                            style: TextStyle(color: Colors.white),
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Lionel Messi",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Lionel Messi",
                            style: TextStyle(color: Colors.white),
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Lionel Messi",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.center,
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child: const Text(
                    "12",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.teal[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Lionel Messi",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.center,
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.teal[300]),
                  child: const Text(
                    "12",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
        ]),
      ),
    );
  }
}
