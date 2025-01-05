import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/controller/getxcontroller.dart';
import 'package:flutter_application_3/screen/barberExplore.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> genaralCategory = [
    {"name": "Basic haircut"},
    {"name": "Coloring"},
    {"name": "Treatment"},
    {"name": "Message"},
    {"name": "kids haircut"}
  ];
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
  final FilterController filterController = Get.put(FilterController());

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
  double bottomSheetHeight = 0;
  void navigateToBarberExplorer(String service) {
    List<Map<String, String>> dataToSend;
    final screenHeight = MediaQuery.of(context).size.height;

    // Set the bottomSheetHeight value
    bottomSheetHeight = screenHeight * 0.5;
    // Determine which list of data to send based on the service selected
    if (service == "All service") {
      dataToSend = [...barbershops, ...cuttingstyle]; // Combine both lists
    } else if (service == "Basic haircut") {
      dataToSend = cuttingstyle; // Send cutting style list
    } else if (service == "Coloring") {
      dataToSend = barbershops; // Send barbershops list
    } else if (service == "Treatment") {
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
          padding: const EdgeInsets.only(top: 45, left: 18, right: 18),
          child: Column(children: [
            // First Container with User Info
            Stack(
              children: [
                // User Info on the Left
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    SizedBox(height: 2),
                    Padding(
                      padding: EdgeInsets.only(),
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

            const SizedBox(height: 10),

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
                              height: 700,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Filter Header
                                    Container(
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffEDEFFB),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'asset/Featured icon.png',
                                              width: 48,
                                              height: 48,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              "Filter",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Image.asset(
                                                'asset/Close Square.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // General Category
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "General Category",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Wrap(
                                            spacing: 12,
                                            runSpacing: 8,
                                            children: genaralCategory
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              int index = entry.key;
                                              String name =
                                                  entry.value['name']!;
                                              return GestureDetector(
                                                onTap: () {
                                                  filterController
                                                      .updateSelectedIndex(
                                                          index);
                                                },
                                                child: Obx(
                                                  () => Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 6,
                                                      horizontal: 12,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: filterController
                                                                  .selectedIndex
                                                                  .value ==
                                                              index
                                                          ? const Color(
                                                                  0xff8683A1)
                                                              .withOpacity(0.2)
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color: filterController
                                                                    .selectedIndex
                                                                    .value ==
                                                                index
                                                            ? Colors.black
                                                            : Colors
                                                                .transparent,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      name,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14.0,
                                                        color: filterController
                                                                    .selectedIndex
                                                                    .value ==
                                                                index
                                                            ? Colors.black
                                                            : const Color(
                                                                0xff8683A1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Rating Barber",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 18),
                                          Obx(
                                            () => Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 242,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Generate the rating stars
                                                        ...List.generate(5,
                                                            (index) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              filterController
                                                                  .updateRating(
                                                                      index +
                                                                          1.0); // Update rating
                                                            },
                                                            child: Icon(
                                                              index <
                                                                      filterController
                                                                          .rating
                                                                          .value
                                                                  ? Icons.star
                                                                  : Icons
                                                                      .star_border,
                                                              color: index <
                                                                      filterController
                                                                          .rating
                                                                          .value
                                                                  ? Colors.amber
                                                                  : Colors.grey,
                                                              size: 40,
                                                            ),
                                                          );
                                                        }),

                                                        // Display the rating value on the right side of the stars
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    "( ${filterController.rating.value.toStringAsFixed(1)})",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff363062),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Obx(() => Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 208,
                                              child: Slider(
                                                value: filterController
                                                    .rating.value,
                                                min: 1.0,
                                                max: 5.0,
                                                divisions: 4,
                                                label: filterController
                                                    .rating.value
                                                    .toStringAsFixed(1),
                                                onChanged: (double newRating) {
                                                  filterController
                                                      .updateRating(newRating);
                                                },
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Distance",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 18),

                                          // Container for nearest distance
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Nearest",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff8683A1)),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:
                                                            48, // Set the width to 39
                                                        height:
                                                            48, // Set the height to 48
                                                        child: TextField(
                                                          onChanged: (value) {
                                                            // Handle change for nearest distance here
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),

                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        12,
                                                                    horizontal:
                                                                        8), // Adjust padding for better alignment
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 6),
                                                      Text(
                                                        "km",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff363062)),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 34,
                                              ),
                                              Text(
                                                "-",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff363062)),
                                              ),
                                              SizedBox(
                                                width: 34,
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Farthest",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff8683A1)),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width:
                                                                48, // Set the width to 39
                                                            height:
                                                                48, // Set the height to 48
                                                            child: TextField(
                                                              onChanged:
                                                                  (value) {
                                                                // Handle change for nearest distance here
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(),

                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            12,
                                                                        horizontal:
                                                                            8), // Adjust padding for better alignment
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 6),
                                                          Text(
                                                            "km",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff363062)),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 18),

                                          // Container for farthest distance
                                        ],
                                      ),
                                    )
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
                          Icons.tune,
                          color: Colors.white,
                          size: 24,
                        ),
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

            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Most recommended",
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
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
            SizedBox(height: 18),
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
                            top: 60,
                            left: 10,
                            right: 0,
                            child: Container(
                              child: Center(
                                child: Image.asset(
                                  "asset/Poin.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 185,
                            left: 240,
                            child: Container(
                              width: 116,
                              height: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xff363062),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Center-align text and icon
                                  children: [
                                    Text(
                                      'Find now',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            8), // Space between text and icon
                                    Icon(
                                      Icons.search, // Search icon
                                      color: Colors.white,
                                      size: 16, // Adjust the size if needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 24,
                            left: 9,
                            right: 0,
                            child: Container(
                              child: Center(
                                child: Image.asset(
                                  "asset/Poin.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 36,
                            left: 191,
                            right: 0,
                            child: Container(
                              child: Center(
                                child: Image.asset(
                                  "asset/Poin.png",
                                  fit: BoxFit.cover,
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
