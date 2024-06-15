class Destination {
  final String imagePath;
  final String title;
  final String location;
  final double rating;
  final double price; // Add price field

  Destination({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.rating,
    required this.price, // Initialize price in the constructor
  });
}
