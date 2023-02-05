import 'dart:convert';

import '../../model/standing_league.dart';
import 'package:http/http.dart' as http;

class FetchDataStandingsLeague {
  static Future<List<StandingLeague>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://app.sportdataapi.com/api/v1/soccer/standings?apikey=1d4badb0-a3cf-11ed-bd9e-7567d15187ec&season_id=2029"));
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
