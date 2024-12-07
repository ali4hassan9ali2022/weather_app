import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/widgets/custom_text_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = "SearchView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a city",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomTextFormField(
        onSubmitted: (value) {
          var weathermodel = BlocProvider.of<WeatherCubit>(context);
          weathermodel.getWeatherCubit(cityName: value);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
