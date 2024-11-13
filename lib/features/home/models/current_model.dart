import 'package:weather_app/features/home/models/weather_type_model.dart';
import 'package:equatable/equatable.dart';

class Current extends Equatable {
  const Current({
    required this.dt,
    this.sunrise,
    this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.weather,
  });

  final int dt;
  final int? sunrise;
  final int? sunset;
  final int temp;
  final double? feelsLike;
  final int pressure;
  final int humidity;
  final double? dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double? windSpeed;
  final List<WeatherType> weather;

  static int mToKm(int m) {
    final km = m / 1000;
    return km.toInt();
  }

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        weather,
      ];

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toInt(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"].toInt(),
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: mToKm(json["visibility"]),
        windSpeed: json["wind_speed"].toDouble(),
        weather: List<WeatherType>.from(
            json["weather"].map((x) => WeatherType.fromJson(x))),
      );
}
