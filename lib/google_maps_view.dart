import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  static final CameraPosition _position = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(41.6176025, 32.3478626),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  late GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.animateCamera(
              CameraUpdate.newLatLngZoom(const LatLng(20, 25), 3));
        },
      ),
      body: GoogleMap(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20,
            vertical: MediaQuery.of(context).size.height / 20),
        mapType: MapType.normal,
        onTap: (value) => print(value.toString() + "Onurrrrrrr0"),
        initialCameraPosition: CameraPosition(target: LatLng(12, 13)),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: _createMarker(),
        onMapCreated: (map) async {
          controller=map;
          // _onMapCreated;
          await _createMarkerImageFromAsset();
        },
      ),
    );
  }

  BitmapDescriptor? locationIcon;

  Future<void> _createMarkerImageFromAsset() async {
    if (locationIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      var bitmap = await BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'assets/images/location.png');
      setState(() => locationIcon = bitmap);
    } else {}
  }

  Set<Marker> _createMarker() {
    return <Marker>{
      Marker(
          markerId: MarkerId("value"),
          zIndex: 10,
          position: _position.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          visible: true)
    };
  }

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }
}
