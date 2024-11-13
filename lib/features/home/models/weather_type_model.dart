import 'package:equatable/equatable.dart';

class WeatherType extends Equatable {
  const WeatherType({
    required this.main,
    required this.description,
    required this.icon,
  });

  final String main;
  final String description;
  final String icon;

  factory WeatherType.fromJson(Map<String, dynamic> json) => WeatherType(
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  @override
  List<Object> get props => [main, description, icon];
}
