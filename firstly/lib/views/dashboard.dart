import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:firstly/views/booking_form_screen.dart';
import 'package:firstly/views/homescreen.dart';

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
      appBar: AppBar(
        title: const Text("Welcome Back ✈️"),
        backgroundColor: Color.fromARGB(255, 2, 39, 39),
        foregroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchDestinations,
              child: SingleChildScrollView(
                controller: _scrollController,

                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Search Bar ──────────────────────────
                      TextField(
                        controller: _searchController,
                        onChanged: _onSearch,
                        decoration: InputDecoration(
                          hintText: "Search destinations...",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                    _onSearch('');
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 2, 39, 39),
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── Special Deal Banner ─────────────────
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 2, 39, 39),
                              Color.fromARGB(255, 2, 39, 39),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.local_offer, color: Colors.white),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "30% Off Flights!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Limited time — book before May 2026",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── Popular Destinations ────────────────
                      const Text(
                        "Popular Destinations",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Horizontal scroll when not searching
                      _searchController.text.isNotEmpty
                          ? _filteredDestinations.isEmpty
                                ? const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Text("No destinations found"),
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
                              height: 150,
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

                      const SizedBox(height: 20),

                      const Text(
                        "Quick Actions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _QuickAction(
                            icon: Icons.flight_takeoff,
                            label: "Book Flight",
                            onTap: () {
                              // Scroll down to destinations
                              _scrollController.animateTo(
                                300,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                          _QuickAction(
                            icon: Icons.flight_land,
                            label: "My Flights",
                            onTap: () {
                              // Go to Bookings tab
                              Get.find<HomeController>().changePage(1);
                            },
                          ),
                          _QuickAction(
                            icon: Icons.support_agent,
                            label: "Support",
                            onTap: () {
                              Get.dialog(
                                AlertDialog(
                                  title: const Text("Support"),
                                  content: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(
                                          Icons.email,
                                          color: Color.fromARGB(255, 2, 39, 39),
                                        ),
                                        title: Text("support@travelapp.com"),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.phone,
                                          color: Color.fromARGB(255, 2, 39, 39),
                                        ),
                                        title: Text("+254 700 000 000"),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("Close"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

// ── Horizontal Destination Card ───────────────────────────
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
        width: 130,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 20),
              const SizedBox(height: 4),
              Text(
                destination['Name'] ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                destination['Country'] ?? '',
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
              const SizedBox(height: 4),
              Text(
                "KES ${destination['price'] ?? '0'}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Search Result List Tile ───────────────────────────────
class _DestinationListTile extends StatelessWidget {
  final dynamic destination;
  const _DestinationListTile({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.location_on, color: Colors.white),
        ),
        title: Text(destination['Name'] ?? ''),
        subtitle: Text("${destination['City']}, ${destination['Country']}"),
        trailing: Text(
          "KES ${destination['price'] ?? '0'}",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Get.to(() => BookingFormScreen(destination: destination));
        },
      ),
    );
  }
}

// ── Quick Action Button ───────────────────────────────────
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
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.blue.shade50,
            child: Icon(icon, color: Colors.blue, size: 26),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
