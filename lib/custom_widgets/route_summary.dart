import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_example/constants/colors.dart';
import 'package:map_example/cubit/setdistance_cubit.dart';
import 'package:map_example/custom_widgets/custom_icon.dart';

class RouteSummary extends StatelessWidget {
  const RouteSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocConsumer<SetdistanceCubit, SetdistanceState>(
        listener: (context, state) {
          if (state is SetdistanceFailed) {
            SnackBar(
              content: Text('${state.message}'),
              backgroundColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          if (state is SetdistanceInitial) {
            return Column(children: [
              Center(
                child: Text(
                  "Get New Delivery",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () =>
                    context.read<SetdistanceCubit>().getRoadOnMap(),
                child: const CustomIcon(0, Icons.delivery_dining),
              )
            ]);
          }
          if (state is SetdistanceLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: primary,
              ),
            );
          }
          if (state is SetdistanceLoaded) {
            return Column(
              children: [
                Center(
                  child: Text(
                    "Route",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const CustomIcon(45, Icons.navigation),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.distance?.toStringAsFixed(2) ?? 0} KM',
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                            Text(
                              'Distance',
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const CustomIcon(0, Icons.timer),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.time?.toStringAsFixed(1)} min',
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                            Text(
                              'ETA',
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
