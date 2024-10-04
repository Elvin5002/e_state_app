import '../../../cubits/property/property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  late GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PropertyCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.selectLocation),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.of(context).pop(cubit.selectedLocation.value);
            },
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(40.4093, 49.8671),
          zoom: 12,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        onTap: (position) {
          cubit.updateLocation(position);
          setState(() {});
        },
        markers: cubit.selectedLocation.value != null
            ? {
                Marker(
                  markerId: const MarkerId('selectedLocation'),
                  position: cubit.selectedLocation.value!,
                ),
              }
            : {},
      ),
    );
  }
}
