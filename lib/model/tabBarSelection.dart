import 'package:sportapp/Stats.dart';

class TabBarSelection {
  final bool statisticsIsPressed;
  final bool timelineIsPressed;
  final bool lineupsIsPressed;
  final bool rankingIsPressed;

  TabBarSelection(
      {required this.statisticsIsPressed,
      required this.timelineIsPressed,
      required this.lineupsIsPressed,
      required this.rankingIsPressed});

  TabBarSelection copyWith(
      {bool? statisticsIsPressed,
      bool? timelineIsPressed,
      bool? lineupsIsPressed,
      bool? rankingIsPressed}) {
    return TabBarSelection(
        statisticsIsPressed: statisticsIsPressed ?? this.statisticsIsPressed,
        timelineIsPressed: timelineIsPressed ?? this.timelineIsPressed,
        lineupsIsPressed: lineupsIsPressed ?? this.lineupsIsPressed,
        rankingIsPressed: rankingIsPressed ?? this.rankingIsPressed);
  }
}

class InitialTabBarSelection extends TabBarSelection {
  InitialTabBarSelection()
      : super(
            statisticsIsPressed: true,
            timelineIsPressed: false,
            lineupsIsPressed: false,
            rankingIsPressed: false);
}
