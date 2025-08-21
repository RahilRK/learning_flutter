part of 'player_cubit.dart';

final List<Map<String, dynamic>> allPlayers = [
  {"name": "Sachin", "country": "India"},
  {"name": "Kohli", "country": "India"},
  {"name": "Ponting", "country": "Australia"},
  {"name": "Sangakara", "country": "Sri Lanka"},
  {"name": "McCullam", "country": "New Zealand"},
  {"name": "Shoheb Aktar", "country": "Pakistan"},
  {"name": "Kallis", "country": "South Africa"},
  {"name": "Dravid", "country": "India"},
  {"name": "Bratt Lee", "country": "Australia"},
  {"name": "Malinga", "country": "Sri Lanka"},
  {"name": "Shane Warne", "country": "Australia"},
];

sealed class PlayerState {}

final class PlayerInitialState extends PlayerState {
  final List<Map<String, dynamic>> players;

  PlayerInitialState(this.players);
}

final class PlayerFilteredState extends PlayerState {
  final List<Map<String, dynamic>> filteredPlayers;

  PlayerFilteredState(this.filteredPlayers);
}
