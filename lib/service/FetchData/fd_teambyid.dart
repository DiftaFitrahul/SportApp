import 'dart:convert';

import '../../model/team.dart';
import 'package:http/http.dart' as http;

class FetchDataTeambyId {
  static Future<Team> fetchdata(String teamID) async {
    try {
      final response = await http.get(Uri.parse(
          "https://app.sportdataapi.com/api/v1/soccer/teams/$teamID?apikey=7657cf70-a86b-11ed-98f0-47029b54f28b"));
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
