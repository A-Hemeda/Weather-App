import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/utils.dart';
import '../models/weather_one_call_model.dart';
import '../resources/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  final _repository = HomeRepository();

  double? lat;
  double? long;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetHomeData) {
      yield* _mapGetHomeDataEventToState(event);
    }
    if (event is LocationError) {
      yield* _mapLocationNotEnabledToState(event);
    }
  }

  Stream<HomeState> _mapLocationNotEnabledToState(LocationError event) async* {
    yield HomeLocationNotEnabled(event.error);
  }

  Stream<HomeState> _mapGetHomeDataEventToState(GetHomeData event) async* {
    yield HomeLoading();
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('lat', event.lat);
    prefs.setDouble('long', event.long);
    // try {
    Response response =
        await _repository.getHomeData(lat: event.lat, long: event.long);
    Response gRes =
        await _repository.getLocationName(lat: event.lat, long: event.long);
    // print(response.data);
    if (response.statusCode == 200) {
      final weatherData = WeatherData.fromJson(response.data);

      final place =
          gRes.data['results'][0]["address_components"][1]["long_name"];
      // final gData = GMapData.fromJson(gRes.data);
      // final place = gData.results[0].addressComponents[1].longName;
      yield HomeSuccess(weatherData, place);
    } else {
      yield HomeFailed(response.data['message']);
    }
    // } catch (e) {
    //   yield HomeFailed(e.toString());
    // }
  }

  void getLocation() async {
    try {
      Position pos = await determinePosition();
      lat = pos.latitude;
      long = pos.longitude;
      add(GetHomeData(lat: lat!, long: long!));
    } catch (err) {
      // showSnackBar(context, err.toString());
      add(LocationError(err.toString()));
    }
  }
}
