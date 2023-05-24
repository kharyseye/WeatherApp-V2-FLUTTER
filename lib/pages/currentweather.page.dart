import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/weather.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        builder: (context, snapshot) {
          // ignore: unnecessary_null_comparison
          if (snapshot != null) {
            Weather? _weather = snapshot.data;
            if (_weather == null) {
              return Text("error getting weather");
            } else {
              return weatherBox(_weather);
            }
          } else {
            return CircularProgressIndicator();
          }
        },
        future: getCurrentWeather(),
      )),
    );
  }

  Widget weatherBox(Weather _weather) {
    return Column(
      children: <Widget>[
        Text(
          "${_weather.temp}°C",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
        ),
        Text("${_weather.description}"),
        Text("Feels:${_weather.feelsLike}°C"),
      ],
    );
  }

  Future getCurrentWeather() async {
    late Weather weather;
    //String city = "calgary";
    //String apiKey ="2ed8fbd4b422d0437cbd6ce9f8787c58";

    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=2ed8fbd4b422d0437cbd6ce9f8787c58";
    //"https://api.openweathermap/org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(url as Uri);
    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
    } else {
      //TODO: throw error here
    }
    return weather;
  }
}
