class Country {
  final String code;
  final String name;
  final String emoji;
  final String capital;

  Country({required this.code, required this.name, required this.emoji, required this.capital});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'] as String,
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      capital: (json['capital'] as String?) ?? '—',
    );
  }
}
