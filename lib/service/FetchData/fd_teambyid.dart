import 'dart:convert';

import '../../model/team.dart';
import 'package:http/http.dart' as http;

class FetchDataTeambyId {
  static Future<Team> fetchdata(String teamID) async {
    try {
      final response = await http.get(Uri.parse(
          "https://app.sportdataapi.com/api/v1/soccer/teams/$teamID?apikey=1d4badb0-a3cf-11ed-bd9e-7567d15187ec"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final team = jsonDecode(response.body)['data'];
        return Team.fromJson(team);
      } else {
        throw response.statusCode;
      }
    } catch (e) {
      rethrow;
    }
  }
}
