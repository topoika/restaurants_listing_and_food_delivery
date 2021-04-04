import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geolocator/geolocator.dart';
import 'package:wiil_food_and_restaurant_listing/Pages/User_Auth/User_pages/setUserInfo.dart';

import 'package:wiil_food_and_restaurant_listing/theme_data.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  LatLng currentPostion;
  String address;

  void _getUserLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
      print(position.latitude.toString());
      print(position.longitude.toString());
      _getLocation();
    });
  }

  _getLocation() async {
    final coordinates =
        Coordinates(currentPostion.latitude, currentPostion.longitude);
    debugPrint('coordinates is: $coordinates');

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    address = "${first.addressLine} ${first.adminArea}";
  }

  @override
  void initState() {
    _getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Pick Your Location')),
      body: currentPostion != null
          ? Stack(
              children: <Widget>[
                GoogleMap(
                  myLocationEnabled: true,
                  compassEnabled: true,
                  tiltGesturesEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: currentPostion,
                    zoom: 10,
                  ),
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                color: MyColors.primaryColor,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //showDialog();
          print(address.toString());
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SetUserInfo(
                        address: address.toString(),
                      )));
        },
        child: Icon(Icons.check),
      ),
    );
  }

  showDialog() {
    return AlertDialog(
      title: Text('This is your current Location'),
      content:
          Text('Do you want us to use you current address for deliveries?'),
      actions: [
        TextButton(
          onPressed: () {
            //Move to the next page
          },
          child: Text('Ok'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        )
      ],
    );
  }
}
