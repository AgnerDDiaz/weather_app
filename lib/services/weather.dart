import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

class WeatherModel {
  final String baseUrl = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey = '67d1c9926392dc5b0cf30505983addb0';

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentPosition();

    if (location.latitude == null || location.longitude == null) {
      print('No se pudo obtener la ubicación.');
      return null;
    }

    String url =
        '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric&lang=es';

    Networking networking = Networking(url: url);
    var weatherData = await networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Es momento de un 🍦';
    } else if (temp > 20) {
      return '¡Tiempo de pantalones cortos y 👕!';
    } else if (temp < 10) {
      return 'Necesitarás 🧣 y 🧤';
    } else {
      return 'Lleva una 🧥 por si acaso.';
    }
  }
}
