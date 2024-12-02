import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/doctor_data.dart';
import '../widgets/details_doctor_screen.dart';




class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {

  bool showAll = false;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedDoctors = showAll
        ? doctors
        : (doctors..sort((a, b) => a['distance'].compareTo(b['distance']))).take(5).toList();

    List<Map<String, dynamic>> filteredDoctors = displayedDoctors
        .where((doctor) =>
    doctor['name'].toLowerCase().contains(searchText.toLowerCase()) ||
        doctor['specialty'].toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/06/39/05/87/360_F_639058778_PIn6ieLzsODoKVcbH3KXZl4SiXr5IG0i.jpg"),
              radius: 25,
            ),
            SizedBox(width: 8),
            Text(
              'Fares Mohammed',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookingsPage()),
              );
            },
            icon: const Icon(
              Icons.alarm,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryIcon('assets/icons/Icon_Healt.svg', "Healthy", Colors.purple),
                  _buildCategoryIcon('assets/icons/IconPet.svg', "Grooming", const Color(0xffB77EFF)),
                  _buildCategoryIcon('assets/icons/IconPet Food.svg', "Pet Food", const Color(0xffB77EFF)),
                  _buildCategoryIcon('assets/icons/Icon - Home.png', "Boarding", const Color(0xffB77EFF)),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              const SizedBox(height: 20),

              // Veterinary Doctors Title
              const Text(
                'Veterinary Doctors',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // List of Doctors
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return Column(
                    children: [
                      _buildDoctorCard(
                        context,
                        bio:doctor['bio'],
                        name: doctor['name'],
                        specialty: doctor['specialty'],
                        rating: doctor['rating'],
                        distance: "${doctor['distance']} km",
                        imageUrl: doctor['imageUrl'],
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),

              // Show More / Show Less Button
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = !showAll;
                    });
                  },
                  child: Text(
                    showAll ? 'Show Less' : 'Show More',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String icon, String label, Color backgroundColor) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: backgroundColor,
          child: icon.endsWith('.svg')
              ? SvgPicture.asset(icon, height: 28, width: 28)
              : Image.asset(icon, height: 28, width: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildDoctorCard(BuildContext context,
      {required String name,
        required String specialty,
        required double rating,
        required String distance,
        required String imageUrl, required bio}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorProfilePage(
              doctor: {
                'name': name,
                'specialty': specialty,
                'distance': distance,
                'imageUrl': imageUrl,
                bio:bio,
              },
            ),
          ),
        ).then((_) {
        });
      },

      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/vector.svg', width: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}








class AllDoctorsPage extends StatelessWidget {
  const AllDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> categories = [
      {"name": "Cats", "image": "https://images.unsplash.com/photo-1602526218675-b4ac6f3fc2c1"},
      {"name": "Dogs", "image": "https://images.unsplash.com/photo-1603966714596-ec2a191e58c3"},
      {"name": "Birds", "image": "https://images.unsplash.com/photo-1598102412327-d9a60e1609b4"},
      {"name": "Fish", "image": "https://images.unsplash.com/photo-1602526218675-2147f4f1b4d4"},
      {"name": "Rabbits", "image": "https://images.unsplash.com/photo-1574158622681-0178e9de8cd7"},
      {"name": "Horses", "image": "https://images.unsplash.com/photo-1531231001915-dfc300a9b6c1"},
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          'Doctors',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryCard(
              context,
              categories[index]["name"]!,
              categories[index]["image"]!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorListPage(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 12),
            Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorListPage extends StatelessWidget {
  final String category;

  const DoctorListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<_DoctorData> doctors;

    switch (category) {
      case "Cats":
        doctors = [
          _DoctorData(
            name: "Dr. Kalini Jithma",
            specialty: "Veterinary Behavioral",
            rating: 4.8,
            distance: "12 km",
            imageUrl: "https://randomuser.me/api/portraits/women/21.jpg",
          ),
          _DoctorData(
            name: "Dr. D. Deshapriya",
            specialty: "Veterinary Surgery",
            rating: 4.9,
            distance: "8 km",
            imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
          ),
        ];
        break;
      case "Dogs":
        doctors = [
          _DoctorData(
            name: "Dr. Sanjay Kumar",
            specialty: "Veterinary Medicine",
            rating: 4.7,
            distance: "10 km",
            imageUrl: "https://randomuser.me/api/portraits/men/12.jpg",
          ),
          _DoctorData(
            name: "Dr. Priya Nair",
            specialty: "Veterinary Care",
            rating: 4.6,
            distance: "15 km",
            imageUrl: "https://randomuser.me/api/portraits/women/34.jpg",
          ),
        ];
        break;
      case "Birds":
        doctors = [
          _DoctorData(
            name: "Dr. Anjali Patil",
            specialty: "Avian Medicine",
            rating: 5.0,
            distance: "20 km",
            imageUrl: "https://randomuser.me/api/portraits/women/56.jpg",
          ),
          _DoctorData(
            name: "Dr. Rajesh Singh",
            specialty: "Poultry Care",
            rating: 4.5,
            distance: "25 km",
            imageUrl: "https://randomuser.me/api/portraits/men/78.jpg",
          ),
        ];
        break;
      default:
        doctors = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: doctors.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return _buildDoctorCard(
              context,
              name: doctor.name,
              specialty: doctor.specialty,
              rating: doctor.rating,
              distance: doctor.distance,
              imageUrl: doctor.imageUrl,
            );
          },
        ),
      ),
    );
  }

  Widget _buildDoctorCard(
      BuildContext context, {
        required String name,
        required String specialty,
        required double rating,
        required String distance,
        required String imageUrl,
      }) {
    return GestureDetector(
      onTap: () {
        // Add action here
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/vector.svg', width: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorData {
  final String name;
  final String specialty;
  final double rating;
  final String distance;
  final String imageUrl;

  _DoctorData({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.imageUrl,
  });
}



class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
      ),
      body: const Center(
        child: Text('Your bookings will appear here.'),
      ),
    );
  }
}








