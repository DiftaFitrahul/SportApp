import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/model/matchTeams.dart';
import 'package:http/http.dart' as http;

class FetchDataMatch {
  Future<MatchTeams> fetchData(String matchId) async {
    try {
      final response = await http.get(Uri.parse(
          "https://app.sportdataapi.com/api/v1/soccer/matches/$matchId?apikey=7657cf70-a86b-11ed-98f0-47029b54f28b"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final dataMatch =
            jsonDecode(response.body)['data'] as Map<String, dynamic>;
        return MatchTeams.fromJson(dataMatch);
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      rethrow;
    }
  }
}

final matchProvider = Provider((ref) => FetchDataMatch(),);
