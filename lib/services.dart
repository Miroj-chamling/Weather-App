import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model.dart';

class DataServices {
  Future<WeatherData> getWeatherData(String city) async {
    final queryParameters = {
      "q": city,
      "appid": "565e07b049ffdf7d99e988c6699cb538",
      "units": "metric",
    };

    final uri = Uri.https(
        "api.openweathermap.org", "/data/2.5/weather", queryParameters);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherData.fromJson(json);
  }
}
