import './location.dart';
import 'networking.dart';

const apiKey = '27940c3a9fd30a4ed2c5a4a9d4614a10';
const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  // Get City weather By City name ===================================
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherMapUrl?q=$cityName&APPID=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  // Get Location Weather=================================
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&APPID=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
