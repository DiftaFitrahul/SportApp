import 'package:flutter/material.dart';
import 'package:sportapp/model/standing_league.dart';
import 'package:sportapp/service/FetchData/fd_teambyid.dart';
import 'package:sportapp/shimmer_widget.dart';

class Standings extends StatelessWidget {
  final int? number;
  final List<StandingLeague> data;
  const Standings({super.key, required this.number, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        padding: const EdgeInsets.only(
          bottom: 3,
          top: 3,
          right: 5,
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 3),
                  child: ShimmerWidget.rectangular(
                    width: 30,
                    height: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 3),
                  child: ShimmerWidget.circular(width: 40),
                ),
                Expanded(
                    child: ShimmerWidget.rectangular(
                        width: 10, height: double.infinity)),
              ],
            );
          },
        ));
  }
}
