import 'package:flutter/material.dart';
import 'trip_create_screen.dart';
import 'trip_chat_screen.dart';
import 'trip_expense_screen.dart';
import 'user_profile_screen.dart';
import 'trip_gallery_screen.dart';

class TripListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trips; // Your trip data model
  final String authToken;

  const TripListScreen({super.key, required this.trips, required this.authToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trips')),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          final tripName = trip['name'] ?? 'Trip ${index + 1}';
          final tripSubtitle = trip['description'] ?? 'Adventure trip with friends';
          final tripId = trip['id'] ?? 'trip_${index + 1}';

          return ListTile(
            leading: const Icon(Icons.travel_explore),
            title: Text(tripName),
            subtitle: Text(tripSubtitle),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.chat),
                      title: const Text('Open Chat'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TripChatScreen(tripName: tripName),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.money),
                      title: const Text('Manage Expenses'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TripExpenseScreen(tripName: tripName),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.photo_album),
                      title: const Text('Trip Gallery'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TripGalleryScreen(tripId: tripId),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('User Profile'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const UserProfileScreen(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_add),
                      title: const Text('Invite Friends'),
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (_) => InviteFriendsDialog(
                            tripId: tripId,
                            authToken: authToken,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TripCreateScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
