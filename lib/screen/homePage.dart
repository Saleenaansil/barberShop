import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/screen/barberExplore.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
      'name': 'Varcity Barbershop Jogja ex The Varcher',
      'location': 'Banguntapan (5 km)',
      'rating': '4.5',
      'svg': 'asset/Rectangle 1547 (1).png',
    },
    {
      'name': 'Twinsky Monkey Barber & Men Stuff',
      'location': 'Jalan Kaliurang (8 km)',
      'rating': '5.0',
      'svg': 'asset/Rectangle 1547 (2).png',
    },
    {
      'name': 'Barberman - Haircut styling & massage',
      'location': 'Jogja Expo Centre (12 km)',
      'rating': '4.5',
      'svg': 'asset/Rectangle 1547 (3).png',
    },
  ];

  int selectedIndex = 0;
  void navigateToBarberExplorer(String service) {
    List<Map<String, String>> dataToSend;

    // Determine which list of data to send based on the service selected
    if (service == "All service") {
      dataToSend = [...barbershops, ...cuttingstyle]; // Combine both lists
    } else if (service == "Basic haircut") {
      dataToSend = cuttingstyle; // Send cutting style list
    } else if (service == "Coloring") {
      dataToSend = barbershops; // Send barbershops list
    }
    else if (service == "Treatment") {
      dataToSend = barbershops; // Send barbershops list
    } else {
      dataToSend = []; // No data
    }

    // Navigate to BarberExplorer and pass the data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Barberexplore(data: dataToSend),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 57, left: 12, right: 18),
          child: Column(children: [
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8), // Top-left corner radius
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight:
                              Radius.circular(8) // Top-right corner radius
                          ),
                      child: Image.asset(
                        "asset/Home Card.png",
                        fit: BoxFit
                            .cover, // Ensures the image covers the available space
                      ),
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

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 578, // Height of the bottom sheet
                              width: 375, // Width of the bottom sheet
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(24), // Top-left radius
                                  topRight:
                                      Radius.circular(24), // Top-right radius
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // First widget inside the container
                                    Container(
                                      width: 375,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffEDEFFB),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              24), // Top-left radius
                                          topRight: Radius.circular(
                                              24), // Top-right radius
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'asset/Featured icon.png', // Replace with your image path
                                                width: 48,
                                                height:
                                                    48, // Height of the image
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(width: 10),
                                              const Text(
                                                "Filter",
                                                style: TextStyle(
                                                  color: Color(0xff111827),
                                                  fontSize: 18,
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(width: 198),
                                              Image.asset(
                                                'asset/Close Square.png', // Replace with your image path
                                                // width: 24,
                                                // height:
                                                //     24, // Height of the image
                                                // fit: BoxFit.cover,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: 20), // Space between widgets

                                    // Second widget inside the container
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18, right: 18),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 339,
                                            color: Colors.white,
                                            child: const Center(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "General Category",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 18,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Basic haircut",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8683A1),
                                                          )),
                                                      SizedBox(width: 12),
                                                      Text("Coloring",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8683A1),
                                                          )),
                                                      SizedBox(width: 12),
                                                      Text("Treatment",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8683A1),
                                                          ))
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Massage",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8683A1),
                                                          )),
                                                      SizedBox(width: 12),
                                                      Text("Kids haircut",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff8683A1),
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height: 20), // Space between widgets

                                    // Third widget inside the container
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18, right: 18),
                                      child: Container(
                                        height: 80,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18),
                                              child: Container(
                                                child: const Text(
                                                  "Rating Barber",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Image.asset(
                                                'asset/Rating.png', // Replace with your image path
                                                width: 242,
                                                // Height of the image
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18, right: 18),
                                      child: Container(
                                        width: 339,
                                        child: Image.asset(
                                          'asset/Section Distance.png', // Replace with your image path
                                          width: 48,
                                          // Height of the image
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, right: 18),
                                          child: GestureDetector(
                                            onTap: () {
                                              // Navigate to the next page
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Barberexplore(data: [
                                                    ...barbershops,
                                                    ...cuttingstyle
                                                  ]), // Replace with your next page widget
                                                ),
                                              );
                                            },
                                            child: Container(
                                                width: 339,
                                                height: 54,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff363062),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Center(
                                                  child: Text("Apply",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                      )),
                                                )),
                                          ),
                                        )
                                      ],
                                    ), // Space between widgets
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
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
                    )
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
            Column(
              children: [
                Container(
                  width: 133,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xff363062), // Set the border color here
                      width: 2, // Optional: Adjust border width
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "See All",
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          'asset/Square Arrow Right Up.png', // Replace with your asset path
                          width: 24, // Set the width of the image
                          height: 24, // Set the height of the image
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),

            Container(
              width: 339,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Most recommended",
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Color(0xFF111827),
                ),
              ),
            ),
            SizedBox(width: 16),
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
                          padding: EdgeInsets.only(left: 0),
                          child: Row(
                            children: [
                              SizedBox(width: 24, height: 42),
                              Text(
                                'Booking ',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
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
            SizedBox(
              height: 16,
            ),
            Container(
              width: 340,
              height: 8,
              child: Image.asset(
                "asset/Slider.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: cuttingstyle.map((barbershop) {
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
            Column(
              children: [
                Container(
                  width: 133,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xff363062), // Set the border color here
                      width: 2, // Optional: Adjust border width
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          'asset/Square Arrow Right Up.png', // Replace with your asset path
                          width: 24, // Set the width of the image
                          height: 24, // Set the height of the image
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 339,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Find a barber nearby",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: double.infinity,
                      height: 225,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          // Background image
                          Positioned.fill(
                            child: Image.asset(
                              "asset/Maps.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned(
                            top: 190,
                            left: 205,
                            right: 0,
                            child: Container(
                              width: 116,
                              height: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xff363062),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Find now',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              // color: Color(0xff94A3B8),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer,
              // color: Color(0xff94A3B8),
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
//color: Color(0xff94A3B8),
            ),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'asset/User Rounded.png', // Replace with your asset path
              width: 24, // Set the width of the image
              height: 24, // Set the height of the image
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xff363062),
        unselectedItemColor: Color(0xff94A3B8),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
