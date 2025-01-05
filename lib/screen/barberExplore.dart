import 'package:flutter/material.dart';
import 'package:flutter_application_3/screen/homePage.dart';

class Barberexplore extends StatefulWidget {
  final List<Map<String, String>> data;

  const Barberexplore({super.key, required this.data});

  @override
  _BarberexploreState createState() => _BarberexploreState();
}

class _BarberexploreState extends State<Barberexplore> {
  final List<Map<String, String>> barbershops = [
    {"name": "All service", "details": "Full range of barbershop services."},
    {"name": "Basic haircut", "details": "Standard haircut for all styles."},
    {"name": "Coloring", "details": "Hair coloring and styling."},
    {"name": "Treatment", "details": "Hair treatments for healthier hair."},
  ];

  int selectedIndex = 0;

  List<String> servicesData = [];

  void loadDataForService(String serviceName) {
    setState(() {
      if (widget.data.isEmpty) {
        servicesData = ["No services available"];
        return;
      }

      if (serviceName == "All service") {
        servicesData = widget.data
            .map((barbershop) => barbershop['name'] ?? "Unknown")
            .toList();
      } else {
        servicesData = widget.data
            .where((barbershop) => barbershop['name'] == serviceName)
            .map(
                (barbershop) => barbershop['details'] ?? "No details available")
            .toList();
      }
    });

    print("Loaded services for $serviceName: $servicesData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 49, left: 18, right: 18),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage()), // Navigate to HomePage
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 16), // Reduced width for back button
                    Text(
                      "Explore Barbers",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Reduced gap
              Container(
                width: double.infinity,
                height: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
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
              SizedBox(height: 8), // Reduced gap
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
              const SizedBox(height: 8), // Reduced gap
              Container(
                width: 340,
                height: 8,
                child: Image.asset(
                  "asset/Slider.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12), // Reduced gap
              Row(
                children: [
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xffEBF0F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child: Row(
                        children: [
                          Icon(Icons.search,
                              color: const Color(0xff363062), size: 24),
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
                  const SizedBox(
                      width: 8), // Space between the search bar and icon
                  Container(
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
                ],
              ),
              const SizedBox(height: 12), // Reduced gap
              // Horizontal Scrollable Row of Barbershop Names
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: barbershops.map((barbershop) {
                      int index = barbershops.indexOf(barbershop);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index; // Update selected index
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 6), // Space between items
                          padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal:
                                  12), // Add padding inside the container
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Color(0xffD7D6E0).withOpacity(0.2)
                                : Colors
                                    .transparent, // Background color change on selection
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors
                                      .transparent, // Black border on selection, transparent otherwise
                              width: 1, // Border width
                            ), // Rounded corners
                          ),
                          child: Text(
                            barbershop['name']!,
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Color(
                                      0xff8683A1), // Change color when selected
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    final barbershop = widget.data[index];
                    return Container(
                      margin: const EdgeInsets.only(
                          bottom: 8), // Reduced margin between items
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            barbershop['svg'] ?? '',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 12),
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
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xff8683A1),
                                      size: 19,
                                    ),
                                    const SizedBox(width: 4),
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
                                Text(
                                  barbershop['details'] ?? '',
                                  style: const TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                    color: Color(0xFF8683A1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
