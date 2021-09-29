import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/services.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var getnetworkdata;
  String apikey='3c4788da2b03af149027d5dd053b0f13';
  @override
  void initState() {
    getlocationData();
    super.initState();
  }
  void getlocationData() async {
    Location location = Location();
    await location.getLocation();
    ServiceApi getdata = ServiceApi(url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=$apikey&units=metric');
     getnetworkdata = await getdata.GetApi();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(getweather:getnetworkdata);

    }),);
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:Center(
          child:SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ) ,
        ),
      );
    }
  }

