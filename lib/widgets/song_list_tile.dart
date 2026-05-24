import 'package:flutter/material.dart';

// This is the song row widget used in "Start Listening" section
// Shows: small image | title + subtitle | 3-dot menu
class SongListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const SongListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Small square album image
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 56,
                  height: 56,
                  color: Color(0xFF333333),
                  child: Icon(Icons.music_note,
                      color: Colors.grey, size: 24),
                );
              },
            ),
          ),
          SizedBox(width: 14),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // 3-dot menu icon
          Icon(
            Icons.more_vert,
            color: Colors.grey[500],
            size: 22,
          ),
        ],
      ),
    );
  }
}