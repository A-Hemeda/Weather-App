import '../../../core/constants/app_constants.dart';
import '../../../core/network/api_base_helper.dart';
import '../../../core/utils/secrets.dart';

class CityRepository {
  final _apiBaseHelper = ApiBaseHelper();

  Future<dynamic> getCityWeather({
    required String city,
    String unit = 'metric',
  }) async {
    final query = "q=$city&appid=$apiKey&units=$unit";
    final path = "$baseUrl/weather?$query";

    final response = await _apiBaseHelper.get(path);
    return response;
  }
}
