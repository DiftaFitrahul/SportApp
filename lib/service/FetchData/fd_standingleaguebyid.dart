import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/standing_league.dart';
import 'package:http/http.dart' as http;

class FetchDataStandingsLeague {
  Future<List<StandingLeague>> fetchData({required String id}) async {
    try {
      final response = await http.get(Uri.parse(
          "https://app.sportdataapi.com/api/v1/soccer/standings?apikey=7657cf70-a86b-11ed-98f0-47029b54f28b&season_id=$id"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final standingsLeague =
            jsonDecode(response.body)['data']['standings'] as List;

        return standingsLeague.map((e) => StandingLeague.fromJson(e)).toList();
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final standingProvider = Provider((ref) => FetchDataStandingsLeague());
