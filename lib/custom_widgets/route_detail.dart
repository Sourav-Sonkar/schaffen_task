import 'package:map_example/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RouteLabel extends StatelessWidget {
  final String label;
  const RouteLabel(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: secondary.withOpacity(0.2), shape: BoxShape.circle),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration:
                    const BoxDecoration(color: primary, shape: BoxShape.circle),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
