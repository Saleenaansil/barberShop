import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> barbershops = [
    {
      'name': 'Alana Barbershop-Haircut, Massage & Spa',
      'location': 'Banguntapan (5 km)',
      'rating': '4.5',
      'svg': 'asset/lisistimage1.png',
    },
    {
      'name': 'Hercha Barbershop-Haircut & Styling',
      'location': 'Jalan Kaliurang (8 km)',
      'rating': '5.0',
      'svg': 'asset/lisistimage1.png',
    },
    {
      'name': 'Barberking-Haircut Styling & Massage',
      'location': 'Jogja Expo Centre (12 km)',
      'rating': '4.5',
      'svg': 'asset/lisistimage1.png',
    },
  ];
  final List<Map<String, String>> cuttingstyle = [
    {
      'name': 'Alana Barbershop-Haircut, Massage & Spa',
      'location': 'Banguntapan (5 km)',
      'rating': '4.5',
      'svg': 'asset/lisistimage1.png',
    },
    {
      'name': 'Hercha Barbershop-Haircut & Styling',
      'location': 'Jalan Kaliurang (8 km)',
      'rating': '5.0',
      'svg': 'asset/lisistimage1.png',
    },
    {
      'name': 'Barberking-Haircut Styling & Massage',
      'location': 'Jogja Expo Centre (12 km)',
      'rating': '4.5',
      'svg': 'asset/lisistimage1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 57, left: 12, right: 18),
          child: Column(
            children: [
              // First Container with User Info
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 6),
                child: Stack(
                  children: [
                    // User Info on the Left
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on, // Map/Location Icon
                                color: Color(0XFF363062),
                                size: 24,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Yogyakarta",
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Text(
                            "Joe Samanta",
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Profile Picture on the Right (Positioned inside Stack)
                    Positioned(
                      right: 18,
                      child: Container(
                        width: 42,
                        height: 49,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.network(
                              'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg', // Replace with your image URL or asset
                              fit: BoxFit.cover,
                              width: 42,
                              height: 42,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Container with "Booking Now" button and Background Image
              Container(
                width: double.infinity,
                height: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      child: Image.asset(
                        "asset/Home Card.png",
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 165.56,
                      left: 17.33,
                      right: 206,
                      child: Container(
                        width: 116,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xff363062),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Booking Now',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

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
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Nearest Barbershop Text
                  const Text(
                    "Nearest Barbershop",
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // List of Barbershops
                  Column(
                    children: barbershops.map((barbershop) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // SVG Image of the Barbershop
                              Image.asset(
                                barbershop['svg'] ?? '',
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 12),
                              // Column with Barbershop Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      barbershop['name'] ?? '',
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0,
                                        color: Color(0xFF111827),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xff8683A1),
                                          size: 19,
                                        ),
                                        Text(
                                          barbershop['location'] ?? '',
                                          style: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.0,
                                            color: Color(0xFF8683A1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xff8683A1),
                                          size: 19,
                                        ),
                                        Text(
                                          "${barbershop['rating']}",
                                          style: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                            color: Color(0xff6B7280),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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
