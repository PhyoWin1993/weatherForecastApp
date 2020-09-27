import 'package:flutter/material.dart';
import 'package:wc/model/weather_forecast_model.dart';
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
          Icon(
            Icons.wb_sunny,
            size: 195,
          ),
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
              ],
            ),
          )
        ],
      ),
    ),
  );

  return midView;
}
