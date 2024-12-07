import 'package:weather_app/Models/weather_model.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {
  WeatherModel weatherModel;
  WeatherLoading(this.weatherModel);
}

final class WeatherFailure extends WeatherState {}
