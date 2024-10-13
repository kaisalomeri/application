import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imageUrl;
  final String post;
  final String name;
  final double rating; // Rating parameter for stars
  final String date; // Date parameter

  CustomContainer({
    required this.imageUrl,
    required this.post,
    required this.name,
    required this.rating,
    required this.date, // Add date parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              imageUrl,
              width: 48.0,
              height: 48.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post

                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                // Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 16.0,
                          );
                        }),
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                // Date
              ],
            ),
          ),
        ],
      ),
    );
  }
}
