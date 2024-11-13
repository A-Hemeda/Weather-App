import 'package:equatable/equatable.dart';

import '../../home/models/weather_type_model.dart';

class CityWeather extends Equatable {
  const CityWeather({
    required this.weather,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.name,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.country,
  });

  final List<WeatherType> weather;
  final int visibility;
  final double wind;
  final int clouds;
  final String name;

  final int temp;
  final int tempMin;
  final int tempMax;
  final double feelsLike;
  final int pressure;
  final int humidity;

  final String country;
  final int sunrise;
  final int sunset;

  factory CityWeather.fromJson(Map<String, dynamic> json) => CityWeather(
        weather: List<WeatherType>.from(
            json["weather"].map((x) => WeatherType.fromJson(x))),
        visibility: json["visibility"].toInt(),
        wind: json["wind"]["speed"].toDouble(),
        clouds: json["clouds"]["all"].toInt(),
        name: json["name"],
        temp: json["main"]["temp"].toInt(),
        tempMin: json["main"]["temp_min"].toInt(),
        tempMax: json["main"]["temp_max"].toInt(),
        feelsLike: json["main"]["feels_like"].toDouble(),
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        sunrise: json["sys"]["sunrise"],
        sunset: json["sys"]["sunset"],
        country: json["sys"]["country"],
      );

  @override
  List<Object> get props => [
        weather,
        visibility,
        wind,
        clouds,
        name,
        temp,
        tempMin,
        tempMax,
        pressure,
        humidity,
        sunrise,
        sunset,
      ];
}
