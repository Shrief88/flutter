import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

// ignore_for_file: prefer_const_constructors

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  void getLocation() async {
    WeatherModel weatherModel = WeatherModel();
    var decodedData = await weatherModel.getLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: decodedData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingPlain(
          color: Colors.white,
          size: 100.0,
          controller: AnimationController(
              duration: Duration(milliseconds: 1200), vsync: this),
        ),
      ),
    );
  }
}
