class StandingLeague {
  final int? position;
  final int? timId;
  final int? match;
  final int? win;
  final int? draw;
  final int? lose;

  StandingLeague({
    required this.position,
    required this.timId,
    required this.match,
    required this.win,
    required this.draw,
    required this.lose,
  });

  factory StandingLeague.fromJson(Map<String, dynamic> json) {
    return StandingLeague(
        position: json['position'],
        timId: json['team_id'],
        match: json['overall']['games_played'],
        win: json['overall']['won'],
        draw: json['overall']['draw'],
        lose: json['overall']['lost']);
  }
}
