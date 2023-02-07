import 'dart:convert';

import 'package:sportapp/model/matchTeams.dart';
import 'package:http/http.dart' as http;

class FetchDataMatch {
  static Future<MatchTeams> fetchData(String matchId) async {
    try {
      final response = await http.get(Uri.parse(
          "https://app.sportdataapi.com/api/v1/soccer/matches/$matchId?apikey=1d4badb0-a3cf-11ed-bd9e-7567d15187ec"));
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
