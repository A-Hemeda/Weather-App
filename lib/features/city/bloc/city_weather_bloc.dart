import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../models/city_weather_model.dart';
import '../resources/city_repository.dart';

part 'city_weather_event.dart';

part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  CityWeatherBloc() : super(CityWeatherInitial());
  final _cityRepository = CityRepository();

  @override
  Stream<CityWeatherState> mapEventToState(
    CityWeatherEvent event,
  ) async* {
    if (event is SearchCityWeather) {
      yield CityWeatherLoading();
      try {
        Response _response =
            await _cityRepository.getCityWeather(city: event.city);
        if (_response.statusCode == 200) {
          final data = CityWeather.fromJson(_response.data);
          yield CityWeatherSuccess(data);
        } else {
          yield CityWeatherFailed(_response.data["message"]);
        }
      } catch (error) {
        yield CityWeatherFailed(error.toString());
      }
    }
  }
}
