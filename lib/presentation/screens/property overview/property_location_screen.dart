import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyLocationScreen extends StatelessWidget {
  const PropertyLocationScreen({super.key, required this.initialLocation});

  final LatLng initialLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.selectLocation),
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 12,
          ),
          onMapCreated: (controller) {},
          markers: {
            Marker(
              markerId: const MarkerId('selectedLocation'),
              position: initialLocation,
            ),
          }),
    );
  }
}
