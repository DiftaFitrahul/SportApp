class MatchTeams {
  final int? matchId;
  final int? leagueId;
  final int? seasonId;
  final String? matchStart;
  final int? minute;
  final String? status;
  final Map<String, dynamic>? goalStats;
  final Map<String, dynamic>? homeTeam;
  final Map<String, dynamic>? awayTeam;
  final List? matchEvent;
  final List? matchStatistic;
  final List? lineUps;
  final Map<String, dynamic>? vanue;

  MatchTeams(
      {required this.matchId,
      required this.leagueId,
      required this.seasonId,
      required this.matchStart,
      required this.minute,
      required this.status,
      required this.goalStats,
      required this.homeTeam,
      required this.awayTeam,
      required this.matchEvent,
      required this.matchStatistic,
      required this.lineUps,
      required this.vanue});

  factory MatchTeams.fromJson(Map<String, dynamic> json) {
    return MatchTeams(
        matchId: json['match_id'],
        leagueId: json['league_id'],
        seasonId: json['season_id'],
        matchStart: json['match_start'],
        minute: json['minute'],
        status: json['status'],
        goalStats: json['stats'],
        homeTeam: json['home_team'],
        awayTeam: json['away_team'],
        matchEvent: json['match_events'],
        matchStatistic: json['match_statistics'],
        lineUps: json['lineups'],
        vanue: json['venue']);
  }
}
