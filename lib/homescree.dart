import "package:flutter/material.dart";
import 'package:weather_app/detailCard.dart';
import 'package:weather_app/model.dart';
import 'package:weather_app/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _dataServices = DataServices();
  final _cityTextController = TextEditingController();

  bool isThemeDark = false;

  late WeatherData _response;

  @override
  void initState() {
    _response = WeatherData(
      cityName: "Location",
      temperature: 0,
      weatherDescription: "",
      humidity: 0,
      pressure: 0,
      wind: 0,
      tempMax: 0,
      tempMin: 0,
      icon: "03d",
    );
    super.initState();
  }

  void _search() async {
    final response =
        await _dataServices.getWeatherData(_cityTextController.text);
    setState(() {
      _response = response;
    });
  }

  final color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isThemeDark = !isThemeDark;
              });
            },
            icon: isThemeDark
                ? const Icon(Icons.wb_sunny_rounded)
                : const Icon(Icons.brightness_2),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: _size.width,
          height: _size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _cityTextController,
                  onChanged: (city) {
                    _search();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    hintText: "Search Location",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _response.cityName.toUpperCase(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                            Text(
                              "${_response.temperature.toInt().toString()}°C",
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Max Temp ${_response.tempMax}°C"),
                                SizedBox(width: 20),
                                Text("Min Temp ${_response.tempMin}°C"),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Image.network(
                                "https://openweathermap.org/img/wn/${_response.icon}@2x.png"),
                            Text(
                              _response.weatherDescription.toUpperCase(),
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        height: 2,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DetailCard(
                              cardName: "Humidity",
                              cardValue: "${_response.humidity} %",
                              icon: Icon(
                                FontAwesomeIcons.droplet,
                                color: color,
                              ),
                            ),
                            const SizedBox(height: 12),
                            DetailCard(
                              cardName: "Pressure",
                              cardValue: "${_response.pressure} Hg",
                              icon: Icon(
                                FontAwesomeIcons.water,
                                color: color,
                              ),
                            ),
                            const SizedBox(height: 12),
                            DetailCard(
                              cardName: "Wind",
                              cardValue: "${_response.wind} Km/s",
                              icon: Icon(
                                FontAwesomeIcons.wind,
                                color: color,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
