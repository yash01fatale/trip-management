import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _nameController = TextEditingController();
  String? _photoUrl; // you can use ImagePicker to update photo later
  Map<String, dynamic> preferences = {}; // example preferences map

  @override
  void initState() {
    super.initState();
    // Load user profile from your backend or local storage
    _nameController.text = 'John Doe'; // example initial data
    _photoUrl = null;
    preferences = {'notifications': true, 'darkMode': false};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _photoUrl != null ? NetworkImage(_photoUrl!) : null,
                  child: _photoUrl == null
                      ? const Icon(Icons.person, size: 50)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Notifications'),
              value: preferences['notifications'] ?? true,
              onChanged: (value) {
                setState(() {
                  preferences['notifications'] = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: preferences['darkMode'] ?? false,
              onChanged: (value) {
                setState(() {
                  preferences['darkMode'] = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save profile to backend or local storage
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile saved')));
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
