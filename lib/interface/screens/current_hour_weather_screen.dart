import 'package:flutter/material.dart';
import 'package:weather/interface/widgets/icon_parameter.dart';
import 'package:weather/interface/widgets/text_parameter.dart';
import 'package:weather/models/day_hour_weather.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentHourWeather extends StatefulWidget {
  final String title;
  final HourWeather hourWeather;

  const CurrentHourWeather({
    super.key,
    required this.title,
    required this.hourWeather,
  });

  String capitalize(String string) {
    return ('${string[0].toUpperCase()}${string.substring(1)}');
  }

  @override
  State<CurrentHourWeather> createState() => _CurrentHourWeatherState();
}

class _CurrentHourWeatherState extends State<CurrentHourWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(widget.title),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.network(
              "https://openweathermap.org/img/wn/${widget.hourWeather.weatherIcon}@2x.png",
              fit: BoxFit.fill,
            ),
          ),
          Text(
            widget.capitalize(widget.hourWeather.weatherDescription),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            '${widget.hourWeather.temp} C°',
            style: const TextStyle(color: Colors.white, fontSize: 75),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Ощущается как ${widget.hourWeather.tempFeels} C°',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconParameter(
                        weatherIcon: WeatherIcons.thermometer_exterior,
                        parameter: widget.hourWeather.tempMin,
                        parameterType: 'C°',
                        iconColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 30,
                      ),
                      IconParameter(
                        weatherIcon: WeatherIcons.thermometer,
                        parameter: widget.hourWeather.tempMax,
                        parameterType: 'C°',
                        iconColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 30,
                      ),

                      /// Доделать температурный коэффициент
                      TextParameter(
                        parameterName: 'KF',
                        parameter: widget.hourWeather.temp,
                        parameterType: '',
                        parameterNameColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconParameter(
                        weatherIcon: WeatherIcons.barometer,
                        parameter: widget.hourWeather.pressure,
                        parameterType: 'мм',
                        iconColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 30,
                      ),
                      TextParameter(
                        parameterName: 'SEA',
                        parameter: widget.hourWeather.pressure,
                        parameterType: 'мм',
                        parameterNameColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 25,
                      ),
                      TextParameter(
                        parameterName: 'GRND',
                        parameter: widget.hourWeather.pressure,
                        parameterType: 'мм',
                        parameterNameColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconParameter(
                        weatherIcon: WeatherIcons.windy,
                        parameter: widget.hourWeather.temp,
                        parameterType: 'м/с',
                        iconColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 30,
                      ),
                      IconParameter(
                        weatherIcon: WeatherIcons.wind_direction,
                        parameter: widget.hourWeather.temp,
                        parameterType: '',
                        iconColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 30,
                      ),
                      TextParameter(
                        parameterName: 'GUST',
                        parameter: widget.hourWeather.temp,
                        parameterType: 'м/с',
                        parameterNameColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconParameter(
                        weatherIcon: WeatherIcons.cloudy,
                        parameter: widget.hourWeather.temp,
                        parameterType: '%',
                        iconColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 30,
                      ),
                      TextParameter(
                        parameterName: 'VIS',
                        parameter: widget.hourWeather.temp,
                        parameterType: 'м',
                        parameterNameColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 25,
                      ),
                      IconParameter(
                        weatherIcon: WeatherIcons.sprinkle,
                        parameter: widget.hourWeather.temp,
                        parameterType: '%',
                        iconColor: Colors.deepPurple,
                        parameterColor: Colors.black,
                        parameterSize: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
