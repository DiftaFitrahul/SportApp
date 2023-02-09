import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/model/matchTeams.dart';
import 'package:sportapp/model/standing_league.dart';
import 'package:sportapp/service/FetchData/fd_standingleaguebyid.dart';

import '../service/FetchData/fd_matchbyid.dart';

final dataStandingsProvider = FutureProvider.family<List<StandingLeague>, String>(
    (ref, seasonId) => ref.watch(standingProvider).fetchData(id: seasonId));

final dataMatchProvider = FutureProvider<MatchTeams>(
    (ref) => ref.watch(matchProvider).fetchData('325104'));
