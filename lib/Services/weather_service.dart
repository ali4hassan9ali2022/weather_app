import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "c9510e43dd2e48eba0c13610240508";
  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMassage = e.response?.data["error"]["message"] ??
          "oops there was an error, try later!";
      throw Exception(errMassage);
    } catch (e) {
      throw Exception("oops there was an error, try later!");
    }
  }
}
