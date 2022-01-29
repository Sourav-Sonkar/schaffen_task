import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_example/constants/colors.dart';
import 'package:map_example/custom_widgets/previous_delivery_card.dart';
import '../constants/resources.dart';

Dialog profileDetails = Dialog(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  child: ListView(
    shrinkWrap: true,
    children: <Widget>[
      const SizedBox(height: 20),
      Row(
        children: [
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage(profilePic),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(
                'Leslie Alex',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '+91 8765341234',
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 10),
      const Divider(
        color: Colors.grey,
        height: 2,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: primary, width: 5)),
                      child: Center(
                          child: Text(
                        '₹100',
                        style: GoogleFonts.poppins(),
                      )),
                    ),
                    Text(
                      'Total Earnings',
                      style: GoogleFonts.poppins(),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: primary, width: 5)),
                            child: Center(
                                child: Text(
                              '₹40',
                              style: GoogleFonts.poppins(),
                            ))),
                        Text(
                          'Todays Earnings',
                          style: GoogleFonts.poppins(),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: primary, width: 5)),
                            child: Center(
                                child: Text(
                              '₹60',
                              style: GoogleFonts.poppins(),
                            ))),
                        Text(
                          'Average Earnings',
                          style: GoogleFonts.poppins(),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primary, width: 1))),
      ),
      const Divider(
        color: Colors.grey,
        height: 2,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20),
        child: Text(
          'Previous Orders',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            HistoryCard('Sagar Restaurant', '27/01/2022',
                'https://assets.quickerala.com/photo/photo_320213_607d5c905293d.jpg'),
            HistoryCard('Paragon Restaurant', '28/01/2021',
                'https://upload.wikimedia.org/wikipedia/commons/4/46/Paragonrestlogo.jpg')
          ],
        ),
      ),
      const SizedBox(height: 20),
    ],
  ),
);
