class Team {
  final int? teamId;
  final String? clubName;
  final String? clubLogo;

  Team({
    required this.teamId,
    required this.clubName,
    required this.clubLogo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        teamId: json['team_id'],
        clubName: json['name'],
        clubLogo: json['logo']);
  }
}
