import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'fad27574298abfd989e6954830b1e46c';

class WeatherModel {
  Future<dynamic> getCityData(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    return await networkHelper.getData();
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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
