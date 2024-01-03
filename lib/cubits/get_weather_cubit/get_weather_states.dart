import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherIntialState extends WeatherStates {}

class WeatherLoadedSuccessfullyState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedSuccessfullyState(this.weatherModel);
}

class WeatherLoadedFailureState extends WeatherStates {
  final String errorMessage;

  WeatherLoadedFailureState(this.errorMessage);
}
