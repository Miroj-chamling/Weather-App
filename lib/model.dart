class WeatherData {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final int humidity;
  final int pressure;
  final double wind;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.humidity,
    required this.pressure,
    required this.wind,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final cityName = json["name"];
    final temperature = json["main"]["temp"];
    final weatherDescription = json["weather"][0]["description"];
    final humidity = json["main"]["humidity"];
    final pressure = json["main"]["pressure"];
    final wind = json["wind"]["speed"];
    return WeatherData(
      cityName: cityName,
      temperature: temperature,
      weatherDescription: weatherDescription,
      humidity: humidity,
      pressure: pressure,
      wind: wind,
    );
  }
}
