part of 'city_weather_bloc.dart';

abstract class GetCityWeatherState extends Equatable {
  const GetCityWeatherState();
}

class GetCityWeatherInitial extends GetCityWeatherState {
  @override
  List<Object> get props => [];
}

class GetCityWeatherLoading extends GetCityWeatherState {
  @override
  List<Object> get props => [];
}

class GetCityWeatherSuccess extends GetCityWeatherState {
  final CityWeather weather;

  const GetCityWeatherSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

class GetCityWeatherFailed extends GetCityWeatherState {
  final String error;

  const GetCityWeatherFailed(this.error);

  @override
  List<Object> get props => [error];
}
