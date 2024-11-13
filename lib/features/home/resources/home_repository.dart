import '../../../core/constants/app_constants.dart';
import '../../../core/network/api_base_helper.dart';
import '../../../core/utils/secrets.dart';

class HomeRepository {
  final _apiBaseHelper = ApiBaseHelper();

  Future<dynamic> getHomeData({
    required double lat,
    required double long,
    String unit = 'metric',
    String exclude = "",
  }) async {
    final query =
        "lon=$long&lat=$lat&appid=$apiKey&units=$unit&exclude=$exclude";
    final path = "$baseUrl/onecall?$query";

    final response = await _apiBaseHelper.get(path);

    return response;
  }

  Future<dynamic> getLocationName(
      {required double lat, required double long}) async {
    final query = "latlng=$lat,$long&key=$googleKey&sensor=true";
    final path = "https://maps.googleapis.com/maps/api/geocode/json?$query";

    final response = await _apiBaseHelper.get(path);
    return response;
  }
}
