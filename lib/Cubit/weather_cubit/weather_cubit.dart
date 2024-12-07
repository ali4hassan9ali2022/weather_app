import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit/weather_state.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  late WeatherModel weatherModel;
  getWeatherCubit({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityName)
          as WeatherModel;
      emit(WeatherLoading(weatherModel));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
