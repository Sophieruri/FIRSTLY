import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Back"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              TextField(
                decoration: InputDecoration(
                  hintText: "Search destinations",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

             
              const Text(
                "Upcoming Trip",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: const Icon(Icons.flight),
                  title: const Text("Nairobi → Dubai"),
                  subtitle: const Text("20 April 2026"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Popular Destinations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DestinationCard("Paris"
                    ),
                    DestinationCard("Bali"),
                    DestinationCard("Dubai"),
                    DestinationCard("Cape Town"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

             
              const Text(
                "Special Deals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                color: Colors.blue.shade50,
                child: const ListTile(
                  leading: Icon(Icons.local_offer),
                  title: Text("30% Off Flights"),
                  subtitle: Text("Limited time offer"),
                ),
              ),
            ],
          ),
        ),
      ),

      
      
    );
  }
}


class DestinationCard extends StatelessWidget {
  final String title;

  const DestinationCard(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}