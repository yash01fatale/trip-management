import 'package:flutter/material.dart';

class TripGalleryScreen extends StatefulWidget {
  final String tripId;
  const TripGalleryScreen({super.key, required this.tripId});

  @override
  State<TripGalleryScreen> createState() => _TripGalleryScreenState();
}

class _TripGalleryScreenState extends State<TripGalleryScreen> {
  List<String> photoUrls = []; // URLs of uploaded photos

  @override
  void initState() {
    super.initState();
  }

  Future<void> uploadPhoto() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Gallery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: uploadPhoto,
          ),
        ],
      ),
      body: photoUrls.isEmpty
          ? const Center(child: Text('No photos yet'))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemCount: photoUrls.length,
              itemBuilder: (context, index) {
                return Image.network(photoUrls[index], fit: BoxFit.cover);
              },
            ),
    );
  }
}
