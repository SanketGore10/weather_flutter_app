import 'package:flutter/material.dart';
import 'package:weatherappclima/screens/location_screen.dart';
import 'package:weatherappclima/services/location.dart';
import 'package:weatherappclima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:weatherappclima/services/weather.dart';

const apiKey = '3536321232663dfea39f86ae1bf480fc';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                locWeather: weatherData,
              )),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(color: Colors.white, size: 100),
      ),
    );
  }
}
