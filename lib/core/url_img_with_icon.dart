import 'package:flutter/material.dart';

class CircularImageWithClearIcon extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onClear;

  // Constructor to take imageUrl and onClear function as parameters
  CircularImageWithClearIcon({required this.imageUrl, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 66,
      child: Stack(
        children: [
          // Circular Network Image
          ClipOval(
            child: Image.network(
              imageUrl,
              height: 66,
              width: 66,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error), // Handle image load errors
            ),
          ),

          // Clear Icon at the top left
          Positioned(
            top: 0,
            left: 0,
            child: InkWell(
              onTap: onClear, // Call the function when clear icon is tapped
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Background for the clear icon
                ),
                child: Icon(
                  Icons.clear,
                  size: 16,
                  color: Colors.black, // Icon color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

