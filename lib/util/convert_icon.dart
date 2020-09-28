import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDec, Color color, double size}) {
  switch (weatherDec) {
    case "Clear":
      {
        return Icon(FontAwesomeIcons.sun, size: size, color: color);
      }
      break;
    case "Clouds":
      {
        return Icon(FontAwesomeIcons.cloud, size: size, color: color);
      }
      break;
    case "Rain":
      {
        return Icon(FontAwesomeIcons.cloudRain, size: size, color: color);
      }
      break;
    case "Snow":
      {
        return Icon(FontAwesomeIcons.snowman, size: size, color: color);
      }
      break;
    default:
      {
        return Icon(FontAwesomeIcons.sun, size: size, color: color);
      }
      break;
  }
}
