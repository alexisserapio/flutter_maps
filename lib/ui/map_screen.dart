import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(19.436522766743465, -99.15424849570454),
    zoom: 16,
  );

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("Monumento a la Revolución"),
      position: LatLng(19.436522766743465, -99.15424849570454),
      infoWindow: InfoWindow(title: "Monumento a la Revolución"),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (controller) {
          _controller = controller;
        },
        mapType: MapType.normal,
        markers: _markers,
      ),
      appBar: AppBar(title: Text("FlutterMaps")),
    );
  }
}
