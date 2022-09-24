import 'package:flutter/material.dart';

class WeatherData {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final double tempMax;
  final double tempMin;
  final int humidity;
  final int pressure;
  final double wind;
  final String icon;

  WeatherData(
      {required this.cityName,
      required this.temperature,
      required this.weatherDescription,
      required this.humidity,
      required this.pressure,
      required this.wind,
      required this.tempMax,
      required this.tempMin,
      required this.icon});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final cityName = json["name"];
    final temperature = json["main"]["temp"];
    final weatherDescription = json["weather"][0]["description"];
    final icon = json["weather"][0]["icon"];
    final humidity = json["main"]["humidity"];
    final pressure = json["main"]["pressure"];
    final wind = json["wind"]["speed"];
    final tempMax = json["main"]["temp_max"];
    final tempMin = json["main"]["temp_min"];

    return WeatherData(
      cityName: cityName,
      temperature: temperature,
      weatherDescription: weatherDescription,
      humidity: humidity,
      pressure: pressure,
      wind: wind,
      tempMax: tempMax,
      tempMin: tempMin,
      icon: icon,
    );
  }
}
