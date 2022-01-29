import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_example/cubit/setdistance_cubit.dart';
import 'package:map_example/custom_widgets/custom_icon.dart';
import 'package:map_example/custom_widgets/custom_label.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:map_example/constants/colors.dart' as colorData;
import '../constants/resources.dart';
import '../custom_widgets/dialog.dart';
import '../custom_widgets/route_detail.dart';
import '../custom_widgets/route_summary.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapController mapController = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 47.4361, longitude: 8.43609),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetdistanceCubit(mapController),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            elevation: 1.5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: colorData.primary,
            actions: [
              BlocBuilder<SetdistanceCubit, SetdistanceState>(
                builder: (context, state) {
                  if (state is SetdistanceLoaded) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InkWell(
                        onTap: () {
                          context.read<SetdistanceCubit>().getRoadOnMap();
                        },
                        child: const CustomIcon(0, Icons.refresh),
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => profileDetails);
                },
                child: const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(profilePic),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
            title: Text(
              widget.title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        body: SlidingUpPanel(
          minHeight: 130,
          panel: BlocBuilder<SetdistanceCubit, SetdistanceState>(
            builder: (context, state) {
              if (state is SetdistanceLoaded) {
                return Center(
                  child: SizedBox(
                    height: 500,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: const RouteSummary(),
                        ),
                        const Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        const CustomLabel('  Your Location', 0, '', '14.25'),
                        const RouteLabel('Right Turn at junction'),
                        const CustomLabel(
                            '  Wellington Curve', 10, '1', '14.45'),
                        const RouteLabel('Pass by Union Square'),
                        const RouteLabel('Take next left'),
                        const CustomLabel(
                            '  St. Vincent Street', 36, '2', '15.30'),
                      ],
                    ),
                  ),
                );
              }
              if (state is SetdistanceLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: colorData.primary,
                  ),
                );
              }
              return Container();
            },
          ),
          collapsed: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: const RouteSummary(),
          ),
          body: OSMFlutter(
            controller: mapController,
            trackMyPosition: false,
            initZoom: 10,
            minZoomLevel: 2,
            maxZoomLevel: 18,
            showZoomController: true,
            stepZoom: 1.0,
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                icon: Icon(
                  Icons.location_history_rounded,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              directionArrowMarker: const MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            roadConfiguration: RoadConfiguration(
              startIcon: const MarkerIcon(
                icon: Icon(
                  Icons.delivery_dining,
                  color: Colors.black,
                  size: 56,
                ),
              ),
              roadColor: Colors.yellowAccent,
            ),
            markerOption: MarkerOption(
                defaultMarker: const MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 56,
              ),
            )),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
