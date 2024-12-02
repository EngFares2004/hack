import 'package:flutter/material.dart';

import '../models/doctor_data.dart';
import '../screens/doctor_chat.dart';
import 'booking.dart';

class DoctorProfilePage extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorProfilePage({required this.doctor, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BookingPage(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(doctor['imageUrl']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.more_vert, color: Colors.black),
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [

                  Text(doctor['name'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Text('Behavior', style: TextStyle(color: Colors.white)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Text('Food', style: TextStyle(color: Colors.white)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Text('Transmition', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: index < 4 ? Colors.blue : Colors.grey,
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int day = 18; day <= 20; day++)
                        GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: day == 19 ? Colors.blue : Colors.grey,
                            ),
                            child: Text('$day', style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                  doctors[5]['bio'],
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Reviews:",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ReviewCard(
                    name: "James Noah",
                    rating: 5.0,
                    review:
                    "Dr. Kalini is a true professional who genuinely cares about his patients. I highly recommend Dr. Kalini to anyone seeking exceptional cardiac care.",
                    profileImageUrl:
                    "https://plus.unsplash.com/premium_photo-1682096259050-361e2989706d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8eW91bmclMjBtYW58ZW58MHx8MHx8fDA%3D", // Example Avatar
                  ),
                  const SizedBox(height: 20),
                  ReviewCard(
                    name: "Mark Rabder",
                    rating: 5.0,
                    review:
                    "Dr. Kalini is a true professional who genuinely cares about his patients. I highly recommend Dr. Kalini to anyone seeking exceptional cardiac care.",
                    profileImageUrl:
                    "https://static.vecteezy.com/system/resources/thumbnails/005/346/410/small_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg", // Example Avatar
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7D16FF), // Hex color code
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Your logic for "Book Now" button goes here
              },
              label: const Icon(Icons.arrow_forward,color: Colors.white,),
              icon: const Text(
                "Book Now",
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7D16FF), // Hex color code
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Correct navigation to the DoctorChatScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorChatScreen()),
                );
              },
              label: const Icon(Icons.chat,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String review;
  final String profileImageUrl;

  ReviewCard({super.key,
    required this.name,
    required this.rating,
    required this.review,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(profileImageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                        (index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  review,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7D16FF), // Hex color code
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                showPrettyBookingBottomSheet(context, "Kalini Jithma");              },
              label: const Icon(Icons.arrow_forward,color: Colors.white,),
              icon: const Text(
                "Book Now",
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            backgroundColor: const Color(0xFF7D16FF),
            onPressed: () {
             // Navigator.push(
              //  context,
               // MaterialPageRoute(builder: (context) => DoctorChatScreen()),
              //);
            },
            child: const Icon(Icons.chat, color: Colors.white),
          ),
        ],
      ),
    );
  }
}