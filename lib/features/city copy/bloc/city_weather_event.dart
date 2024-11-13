part of 'city_weather_bloc.dart';

abstract class GetCityWeatherEvent extends Equatable {
  const GetCityWeatherEvent();
}

class GetCityWeather extends GetCityWeatherEvent {
  final String city;

  const GetCityWeather(this.city);

  @override
  List<Object?> get props => [city];
}
