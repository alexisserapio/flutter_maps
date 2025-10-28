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

  void addMarker(LatLng latLong) async {
    TextEditingController _textController = TextEditingController();
     
    showDialog<String>(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Añade un titulo para el marcador en el mapa"),
        content: TextField(
          controller: _textController,
          decoration: InputDecoration(hint: Text("Casa de ...")),
        ),
      )
    })
  }

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
        onTap: (latLong) => addMarker(latLong),
      ),
      appBar: AppBar(title: Text("FlutterMaps")),
    );
  }
}
