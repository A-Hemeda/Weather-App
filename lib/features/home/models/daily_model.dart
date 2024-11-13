import 'package:weather_app/features/home/models/weather_type_model.dart';
import 'package:equatable/equatable.dart';

class Daily extends Equatable {
  const Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.temp,
    required this.pressure,
    required this.humidity,
    this.dewPoint,
    this.windSpeed,
    required this.windDeg,
    required this.weather,
    required this.clouds,
    this.uvi,
    this.snow,
    this.rain,
  });

  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final TempInDay temp;
  final int pressure;
  final int humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int windDeg;
  final List<WeatherType> weather;
  final int clouds;
  final double? uvi;
  final double? snow;
  final double? rain;

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        moonrise,
        moonset,
        temp,
        pressure,
        humidity,
        dewPoint,
        windSpeed,
        windDeg,
        weather,
        clouds,
        uvi,
        snow,
        rain,
      ];

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        temp: TempInDay.fromJson(json["temp"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather: List<WeatherType>.from(
            json["weather"].map((x) => WeatherType.fromJson(x))),
        clouds: json["clouds"],
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
      );
}

class TempInDay extends Equatable {
  const TempInDay({
    this.min,
    this.max,
  });

  final int? min;
  final int? max;

  @override
  List<Object?> get props => [min, max];

  factory TempInDay.fromJson(Map<String, dynamic> json) => TempInDay(
        min: json["min"] == null ? null : json["min"].toInt(),
        max: json["max"] == null ? null : json["max"].toInt(),
      );
}
