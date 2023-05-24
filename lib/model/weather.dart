class Weather {
  final double? temp;
  final double? feelsLike;
  final String? description;

  Weather(
      {required this.temp, required this.feelsLike, required this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}
