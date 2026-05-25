import 'package:flutter/material.dart';

class RecentlyPlayedCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const RecentlyPlayedCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // Check if local asset or network image
          imageUrl.startsWith('assets/')
              ? Image.asset(
                  imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      color: Color(0xFF333333),
                      child: Icon(Icons.music_note,
                          color: Colors.grey, size: 20),
                    );
                  },
                )
              : Image.network(
                  imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      color: Color(0xFF333333),
                      child: Icon(Icons.music_note,
                          color: Colors.grey, size: 20),
                    );
                  },
                ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}