import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatelessWidget {
  final dynamic weatherData;

  LocationScreen({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = WeatherModel();

    String cityName = weatherData['name'];
    int temp = weatherData['main']['temp'].toInt();
    String conditionIcon = weatherModel.getWeatherIcon(weatherData['weather'][0]['id']);
    String message = weatherModel.getMessage(temp);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Implementar recarga de datos
                    },
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implementar selección de ciudad
                    },
                    child: Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text('$temp°', style: kTempTextStyle),
                    Text(conditionIcon, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message en $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
