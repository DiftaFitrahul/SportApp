import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/model/matchTeams.dart';
import 'package:sportapp/page/match_page.dart';
import 'package:sportapp/provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void getMatchData(WidgetRef ref, MatchTeams newData) {
    ref.read(matchDataNotifier.notifier).updateData(newData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Football")),
      body: Consumer(
          builder: (context, ref, child) => ref.watch(dataMatchProvider).when(
                data: (matchData) => Center(
                  child: InkWell(
                    child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: Colors.lightBlue,
                        child: const Text("Real Madrid vs Barcelona")),
                    onTap: () async {
                      getMatchData(ref, matchData);
                      
                      //await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MatchPage.routeName);
                    },
                  ),
                ),
                error: (error, stackTrace) => const Text("Error"),
                loading: () => const CircularProgressIndicator(),
              )),
    );
  }
}
