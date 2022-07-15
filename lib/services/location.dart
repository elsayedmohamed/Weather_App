import 'package:geolocator/geolocator.dart';

// Get Location By Geolocator ==============================

class Location {
  double? longitude;
  double? latitude;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
