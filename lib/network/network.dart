import 'dart:convert';
import 'package:http/http.dart';
import 'package:wc/model/weather_forecast_model.dart';
import 'package:wc/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl = "http://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=imperial";
    final respone = await get(Uri.encodeFull(finalUrl));
    if (respone.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(respone.body));
    } else {
      throw ("could not connect to api");
    }
  }
}
