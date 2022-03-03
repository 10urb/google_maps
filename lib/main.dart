import 'package:flutter/material.dart';
import 'package:google_maps/google_maps_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Google Maps Demo',
      home: GoogleMapsView(),
    );
  }
}
