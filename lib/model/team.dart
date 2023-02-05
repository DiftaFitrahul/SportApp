class Team {
  final String? clubName;
  final String? clubLogo;

  Team({
    required this.clubName,
    required this.clubLogo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(clubName: json['name'], clubLogo: json['logo']);
  }
}
