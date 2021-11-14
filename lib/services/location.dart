import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;

 Future<void>  getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print("\n location is \n $position");
    } catch (e) {
      print(e);
    }
  }
}
