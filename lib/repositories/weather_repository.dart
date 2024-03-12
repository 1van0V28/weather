import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/current_weather.dart';
import 'package:weather/models/week_weather.dart';

class WeatherRepository {
  final String openKey = '371247700e5cfe7af3a8711e0d6ba638';

  Future<List<dynamic>> getAllWeather(String currentCity) async {
    List<dynamic> weatherInfo = [];
    final responseWeather = await Future.wait([
      http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$currentCity&lang=ru&appid=$openKey&units=metric')),
      http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$currentCity&lang=ru&appid=$openKey&units=metric')),
    ]);
    if (responseWeather[0].statusCode == 200 && responseWeather[1].statusCode == 200) {
      weatherInfo.add(CurrentWeather.fromJson(jsonDecode(responseWeather[0].body)));
      weatherInfo.add(WeekWeather.fromJson(jsonDecode(responseWeather[1].body)));
      return weatherInfo;
    }
    throw Exception('запрос не прошёл');
  }
}
