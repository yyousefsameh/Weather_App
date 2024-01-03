import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search City",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (cityName) async {
              //making object from GetWeatherCubit
              var getWeatherCubitObject =
                  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubitObject.getWeather(cityName: cityName);

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              label: Text("Search"),
              suffixIcon: Icon(
                Icons.search,
              ),
              hintText: "Enter city name",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
