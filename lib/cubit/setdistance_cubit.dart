
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

part 'setdistance_state.dart';

class SetdistanceCubit extends Cubit<SetdistanceState> {
  final MapController mapController;
  SetdistanceCubit(this.mapController) : super(SetdistanceInitial());

  void getRoadOnMap() {
    if (state is SetdistanceLoading) {
      return;
    }
    emit(SetdistanceLoading());
    mapController
        .drawRoad(
      GeoPoint(latitude: 28.7041, longitude: 77.2295),
      GeoPoint(latitude: 28.6505, longitude: 77.2303),
      roadType: RoadType.bike,
      roadOption: RoadOption(
        roadWidth: 10,
        roadColor: Colors.blue,
        showMarkerOfPOI: true,
        zoomInto: true,
      ),
    )
        .then((value) {
      emit(SetdistanceLoaded(distance: value.distance, time: (value.duration!/60)));
      // print("${value.distance}km");
      // print("${value.route}");
    }).catchError((value) {
      emit(SetdistanceFailed(message:"Something went wrong"));
    });
  }
}
