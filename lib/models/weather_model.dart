class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? imagePath;
  final double temprature;
  final double maxTemprature;
  final double minTemprature;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.imagePath,
    required this.temprature,
    required this.maxTemprature,
    required this.minTemprature,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      imagePath: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temprature: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemprature: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemprature: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
