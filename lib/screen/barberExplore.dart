import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Barberexplore extends StatelessWidget {
  Barberexplore({super.key});

  final List<Map<String, String>> barbershops = [
    {"name": "All service"},
    {"name": "Basic haircut"},
    {"name": "Coloring"},
    {"name": "Treatment"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 57, left: 18, right: 18),
          child: Column(
            children: [
              // First Container with User Info
              Container(
                width: 339,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {},
                        ),
                        const SizedBox(
                            width: 16), // Add space between icon and text
                        const Text(
                          'Explore Barbers', // Your AppBar title
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 34),
              Container(
                width: double.infinity,
                height: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      child: Image.asset(
                        "asset/image2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 190,
                      left: 210,
                      right: 0,
                      child: Container(
                        width: 129,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xff363062),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Row(
                              children: [
                                const SizedBox(width: 24, height: 42),
                                const Text(
                                  'Booking ',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  "asset/Calendar Mark.png",
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Container with "Booking Now" button and Background Image
              const SizedBox(height: 24),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 339,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Master piece Barbershop Haircut styling ',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xff8683A1),
                              size: 19,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Joga Expo Centre  (2 km) ',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                                color: Color(0xff8683A1),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xff8683A1),
                              size: 19,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '5.0 ',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                                color: Color(0xff8683A1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: 340,
                height: 8,
                child: Image.asset(
                  "asset/Slider.png",
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),

              // Search Bar and Nearest Barbershop Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xffEBF0F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 18),
                            child: Row(
                              children: [
                                Icon(Icons.search,
                                    color: Color(0xff363062), size: 24),
                                SizedBox(width: 12),
                                Text(
                                  "Search barber’s, haircut service",
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: Color(0xFF8683A1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Right-side Container
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xff363062),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.tune, // Example icon
                          color: Colors.white,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  // Horizontal Scrollable Row of Barbershop Names
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: barbershops.map((barbershop) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            barbershop['name']!, // Display Barbershop Name
                            style: const TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: Color(0xff8683A1),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
