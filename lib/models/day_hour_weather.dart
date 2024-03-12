final List<String> months = [
  'Января',
  'Февраля',
  'Марта',
  'Апреля',
  'Мая',
  'Июня',
  'Июля',
  'Августа',
  'Сентября',
  'Октября',
  'Ноября',
  'Декабря',
];

class HourWeather {
  final String dt;
  final double temp;
  final double tempFeels;
  final double tempMin;
  final double tempMax;
  final double? tempKf;
  final int pressure;
  final int humidity;
  final String weatherDescription;
  final String weatherIcon;

  const HourWeather({
    required this.dt,
    required this.temp,
    required this.tempFeels,
    required this.tempMin,
    required this.tempMax,
    required this.tempKf,
    required this.pressure,
    required this.humidity,
    required this.weatherDescription,
    required this.weatherIcon,
  });

  static String getDate(String date, bool dayHour) {
    if (dayHour) {
      String dayNum = date.substring(8, 10);
      dayNum[0] == '0' ? dayNum = dayNum.substring(1) : dayNum;
      String monthNum = months[int.parse(date.substring(5, 7)) - 1];
      return '$dayNum $monthNum';
    }
    String hourNum = date.substring(11, 16);
    return hourNum;
  }

  /// доделать реализацию температуры
  static Map<String, double> getTemp(Map<String, dynamic> json) {
    Map<String, double> temp = {};
    List<String> tempTypes = ['temp', 'feels_like', 'temp_min', 'temp_max'];
    for (int index = 0; index < tempTypes.length; index++) {
      temp[tempTypes[index]] = json['main'][tempTypes[index]] as double;
    }
    return temp;
  }

  static int getPressure(int pressure) {
    return (pressure * 0.750064).toInt();
  }

  static HourWeather fromJson(Map<String, dynamic> json, bool dayHour) {
    return HourWeather(
      dt: getDate(json['dt_txt'] as String, dayHour),
      temp: json['main']['temp'] as double,
      tempFeels: json['main']['temp'] as double,
      tempMin: json['main']['temp_min'] as double,
      tempMax: json['main']['temp_max'] as double,
      tempKf: json['main']['temp_kf'] as double?,
      pressure: getPressure(json['main']['pressure'] as int),
      humidity: json['main']['humidity'] as int,
      weatherDescription: json['weather'][0]['description'] as String,
      weatherIcon: json['weather'][0]['icon'] as String,
    );
  }
}
