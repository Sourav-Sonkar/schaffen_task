import 'package:delivery_partner/constants/colors.dart';
import 'package:delivery_partner/custom_widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningsCard extends StatelessWidget {
  final IconData icon;
  final int amount;
  final String label;
  const EarningsCard(this.amount, this.icon, this.label, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          elevation: 10,
          shadowColor: Colors.grey,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: primary, width: 0.5)),
            width: 80,
            height: 110,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIcon(0, icon),
                  Text(
                    label,
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                  Text(
                    " ₹ "+amount.toString(),
                    style: GoogleFonts.poppins(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
