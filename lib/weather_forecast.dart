import 'package:flutter/material.dart';
import 'package:wc/model/weather_forecast_model.dart';
import 'package:wc/network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Myanmar";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    // forecastObject
    //     .then((weather) => print("print data is ==>>${weather.sys.country}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
              child: FutureBuilder(
            future: forecastObject,
            builder: (BuildContext context,
                AsyncSnapshot<WeatherForecastModel> snapshot) {
              if (snapshot.hasData) {
                return Text("All Good");
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ))
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "EnterCity Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8)),
        onSubmitted: (value) => print(value),
      ),
    );
  }
}
