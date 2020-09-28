import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wc/model/weather_forecast_model.dart';
import 'package:wc/util/convert_icon.dart';
import 'package:wc/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecList = snapshot.data;
  var dTFomat = new DateTime.fromMillisecondsSinceEpoch(forecList.dt * 1000);
  var city = snapshot.data.name;
  var country = snapshot.data.sys.country;

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$city , $country",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          //Second Text
          Text(
            "${Util.getFormatDate(dTFomat)}",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDec: forecList.weather[0].description,
                color: Colors.pinkAccent,
                size: 198),
          ),
          // Icon(
          //   FontAwesomeIcons.cloud,
          //   size: 198,
          //   color: Colors.pinkAccent,
          // ),
          // Icon(
          //   Icons.wb_sunny,
          //   size: 195,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecList.main.temp.toStringAsFixed(0)} F",
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
                Text("${forecList.weather[0].description.toUpperCase()}"),
              ],
            ),
          ),

          //// this Row level
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // first Column
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecList.wind.speed.toStringAsFixed(1)} mile/h"),
                      Icon(
                        FontAwesomeIcons.wind,
                        size: 20,
                      )

                      // Icon(
                      //   Icons.arrow_forward,
                      //   size: 20,
                      //   color: Colors.brown,
                      // )
                    ],
                  ),
                ),
                // sec column
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                              "${forecList.main.humidity.toStringAsFixed(0)} %"),
                          Icon(
                            FontAwesomeIcons.solidGrinBeamSweat,
                            size: 20,
                          )
                          // Icon(
                          //   Icons.hot_tub,
                          //   size: 20,
                          //   color: Colors.brown,
                          // )
                        ],
                      ),
                    )
                  ],
                ),

                // Third Column
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                              "${forecList.main.tempMax.toStringAsFixed(0)} F"),
                          Icon(
                            FontAwesomeIcons.temperatureHigh,
                            size: 20,
                          )
                          // Icon(
                          //   Icons.wb_sunny,
                          //   size: 20,
                          //   color: Colors.brown,
                          // )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );

  return midView;
}
