import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? subtitle;

  const AlbumCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album Image - supports both local and network
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: imageUrl.startsWith('assets/')
                ? Image.asset(
                    imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _placeholder();
                    },
                  )
                : Image.network(
                    imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _placeholder();
                    },
                  ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (subtitle != null) ...[
            SizedBox(height: 2),
            Text(
              subtitle!,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 11,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 150,
      height: 150,
      color: Color(0xFF333333),
      child: Icon(Icons.music_note, color: Colors.grey, size: 40),
    );
  }
}