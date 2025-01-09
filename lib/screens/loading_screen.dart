import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getWeatherData();

    if (weatherData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(weatherData: weatherData),
        ),
      );
    } else {
      print('No se pudieron obtener los datos del clima.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
