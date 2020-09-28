import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wc/model/weather_forecast_model.dart';
import 'package:wc/util/forecast_util.dart';

Widget forecastCard(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var focdata = snapshot.data.weather;
  var dts = snapshot.data;
  DateTime dt = new DateTime.fromMillisecondsSinceEpoch(dts.dt * 1000);
  var fullD = Util.getFormatDate(dt);
  var dayOfw = fullD.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("This is for Showwin Text"),
      // Add Row

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // add image
          CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            child: Icon(
              FontAwesomeIcons.cloudRain,
              size: 43,
            ),
          ),

          // second data to add row
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //one row
              Row(
                children: [Text("Text"), Text("Icon")],
              ),

              //two row
              Row(
                children: [Text("Text"), Text("Icon")],
              ),

              //three row
              Row(
                children: [Text("t"), Text("Ic")],
              )
            ],
          )
        ],
      )
    ],
  );
}
