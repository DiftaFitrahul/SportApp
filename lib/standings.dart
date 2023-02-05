import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportapp/model/standing_league.dart';
import 'package:sportapp/service/FetchData/fd_teambyid.dart';

class Standings extends StatelessWidget {
  int? number;
  List<StandingLeague> data;
  Standings({super.key, this.number, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        padding: const EdgeInsets.only(
          bottom: 3,
          top: 3,
        ),
        decoration: BoxDecoration(
            color: (number! % 2 == 1) ? Colors.white : Colors.grey[100]),
        child: FutureBuilder(
          future: FetchDataTeambyId.fetchdata(data[number!].timId!.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  Container(
                      color: (number! < 5)
                          ? const Color.fromARGB(255, 221, 110, 66)
                          : Colors.white,
                      alignment: Alignment.center,
                      width: 30,
                      child: Text((number! + 1).toString())),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 5, top: 5, bottom: 5, left: 3),
                    child: Image.network(snapshot.data!.clubLogo ?? ""),
                  ),
                  Expanded(child: Text(snapshot.data!.clubName ?? "")),
                  SizedBox(
                    width: 185,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(data[number!].match.toString()),
                        Text(data[number!].win.toString()),
                        Text(data[number!].draw.toString()),
                        Text(data[number!].lose.toString()),
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("error");
            }
            return Row(
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[300]!,
                    child: Container(
                      width: 30,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(),
                          color: Colors.grey[400]),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, top: 5, bottom: 5, left: 3),
                  child: Image.network(snapshot.data!.clubLogo ?? ""),
                ),
                Expanded(child: Text(snapshot.data!.clubName ?? "")),
                SizedBox(
                  width: 185,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data[number!].match.toString()),
                      Text(data[number!].win.toString()),
                      Text(data[number!].draw.toString()),
                      Text(data[number!].lose.toString()),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
