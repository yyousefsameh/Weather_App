import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "d782a0ad98f544cbb96150908232312";

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
      //Handling if there is an error in response after request
    } on DioException catch (error) {
      final String errorMessage = error.response?.data["error"]["mesage"] ??
          "oops there was an error, try later";
      throw Exception(errorMessage);
      // Handling if there is other error rather than the respones error
    } catch (error) {
      log(error.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
