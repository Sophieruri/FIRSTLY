import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:firstly/views/booking_form_screen.dart';
import 'package:firstly/views/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<dynamic> _allDestinations = [];
  List<dynamic> _filteredDestinations = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost/travelapp/destination.php'),
      );
      if (response.statusCode == 200) {
        setState(() {
          _allDestinations = jsonDecode(response.body);
          _filteredDestinations = _allDestinations;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _onSearch(String query) {
    setState(() {
      _filteredDestinations = query.isEmpty
          ? _allDestinations
          : _allDestinations
                .where(
                  (d) => d['Name'].toString().toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Welcome Back ✈️",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color(0xFF023232),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: const Color(0xFF0077B6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Color(0xFF0077B6),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFF0077B6)),
            )
          : RefreshIndicator(
              color: const Color(0xFF0077B6),
              onRefresh: fetchDestinations,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      TextField(
                        controller: _searchController,
                        onChanged: _onSearch,
                        style: GoogleFonts.poppins(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Search destinations...",
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF0077B6),
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    _onSearch('');
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFF0077B6),
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF8F9FA),
                        ),
                      ),

                      const SizedBox(height: 20),

                    
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0077B6).withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.local_offer,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "30% Off Flights!",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Limited time — book before May 2026",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                     
                      Text(
                        "Quick Actions",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF023232),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _QuickAction(
                            icon: Icons.flight_takeoff,
                            label: "Book Flight",
                            onTap: () {
                              _scrollController.animateTo(
                                400,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                          _QuickAction(
                            icon: Icons.flight_land,
                            label: "My Flights",
                            onTap: () {
                              Get.find<HomeController>().changePage(1);
                            },
                          ),
                          _QuickAction(
                            icon: Icons.support_agent,
                            label: "Support",
                            onTap: () {
                              Get.dialog(
                                AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    "Support",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          Icons.email_outlined,
                                          color: Color(0xFF0077B6),
                                        ),
                                        title: Text(
                                          "support@travelapp.com",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.phone_outlined,
                                          color: Color(0xFF0077B6),
                                        ),
                                        title: Text(
                                          "+254 794 000 140",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text(
                                        "Close",
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF0077B6),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Destinations",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF023232),
                            ),
                          ),
                          Text(
                            "See all",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: const Color(0xFF0077B6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      _searchController.text.isNotEmpty
                          ? _filteredDestinations.isEmpty
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        "No destinations found",
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: _filteredDestinations
                                        .map(
                                          (d) => _DestinationListTile(
                                            destination: d,
                                          ),
                                        )
                                        .toList(),
                                  )
                          : SizedBox(
                              height: 170,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _allDestinations.length,
                                itemBuilder: (context, index) {
                                  return _DestinationCard(
                                    destination: _allDestinations[index],
                                  );
                                },
                              ),
                            ),

                      const SizedBox(height: 24),

                     
                      Text(
                        "All Destinations",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF023232),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Column(
                        children: _allDestinations
                            .map((d) => _DestinationListTile(destination: d))
                            .toList(),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}


class _DestinationCard extends StatelessWidget {
  final dynamic destination;
  const _DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BookingFormScreen(destination: destination));
      },
      child: Container(
        width: 155,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0077B6).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.flight_takeoff,
                  color: Colors.white,
                  size: 20,
                ),
              ),

              // Bottom info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination['Name'] ?? '',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white70,
                        size: 11,
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          destination['Country'] ?? '',
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        "${destination['Rating'] ?? ''}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "KES ${destination['price'] ?? '0'}",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
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

class _DestinationListTile extends StatelessWidget {
  final dynamic destination;
  const _DestinationListTile({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.flight_takeoff,
            color: Colors.white,
            size: 22,
          ),
        ),
        title: Text(
          destination['Name'] ?? '',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: const Color(0xFF023232),
          ),
        ),
        subtitle: Text(
          "${destination['City']}, ${destination['Country']}",
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "KES ${destination['price'] ?? '0'}",
              style: GoogleFonts.poppins(
                color: const Color(0xFF0077B6),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 12),
                const SizedBox(width: 2),
                Text(
                  "${destination['Rating'] ?? ''}",
                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Get.to(() => BookingFormScreen(destination: destination));
        },
      ),
    );
  }
}


class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0077B6).withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF023232),
            ),
          ),
        ],
      ),
    );
  }
}
