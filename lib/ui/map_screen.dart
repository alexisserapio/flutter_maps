import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_maps/l10n/app_localizations.dart';

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
      markerId: MarkerId("MonumentoRevolucion"),
      position: LatLng(19.436522766743465, -99.15424849570454),
      infoWindow: InfoWindow(title: "Monumento a la Revolución"),
    ),
  };

  void addMarker(LatLng latLong) async {
    TextEditingController _textController = TextEditingController();

    String? title = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.alertDialogTitle),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.alertDialogHint,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: Text(AppLocalizations.of(context)!.alertDialogCancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(_textController.text),
              child: Text(AppLocalizations.of(context)!.alertDialogSave),
            ),
          ],
        );
      },
    );

    if (title != null && title.isNotEmpty) {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(latLong.toString()),
            position: latLong,
            infoWindow: InfoWindow(title: title),
          ),
        );
      });
    }
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
