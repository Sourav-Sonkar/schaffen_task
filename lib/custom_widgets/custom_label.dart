import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_example/constants/colors.dart';

class CustomLabel extends StatelessWidget {
  final String place, time, count;
  final double distance;
  const CustomLabel(this.place, this.distance, this.count, this.time,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: primary),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: primary, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          count,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(
                      place,
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
                Text(
                  distance.toString() + " km  ",
                  style: GoogleFonts.poppins(),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: primary),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                time,
                style: GoogleFonts.poppins(),
              )),
            ),
          )
        ],
      ),
    );
  }
}
