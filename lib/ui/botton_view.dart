import 'package:flutter/material.dart';
import 'package:wc/model/weather_forecast_model.dart';
import 'package:wc/ui/forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.weather;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "${forecastList.length} Day Weather forecast".toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.black45),
      ),

      // Second

      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ClipRRect(
            // ClipRRect Data
            borderRadius: BorderRadius.all(Radius.circular(10)),

            child: Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              // need to add one method
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xff9661c3), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),

              child: forecastCard(snapshot, context),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 8.0,
          ),
          itemCount: forecastList.length,
        ),
      )
    ],
  );
}
