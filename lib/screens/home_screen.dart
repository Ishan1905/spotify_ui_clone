import 'package:flutter/material.dart';
import '../widgets/section_header.dart';
import '../widgets/album_card.dart';
import '../widgets/song_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeNavIndex = 0;
  String _activeFilter = 'All';

  final List<Map<String, String>> recommendedStations = [
    {
      'title': 'Yo Yo Honey Singh',
      'subtitle': 'Yo Yo Honey Singh, Himesh Reshammiya, Imran Khan',
      'image': 'https://picsum.photos/seed/101/400',
      'color': '0xFFB5E853'
    },
    {
      'title': 'Guru Randhawa Mix',
      'subtitle': 'Sachin-Jigar, Vishal-Shekhar, Guru Ran...',
      'image': 'https://picsum.photos/seed/102/400',
      'color': '0xFFCB9EFF'
    },
    {
      'title': 'Pritam Mix',
      'subtitle': 'Pritam, Benny Dayal',
      'image': 'https://picsum.photos/seed/103/400',
      'color': '0xFF90D5FF'
    },
  ];

  final List<Map<String, String>> toGetYouStarted = [
    {
      'title': 'Guru Randhawa Mix',
      'subtitle': 'Yo Yo Honey Singh, Harrdy Sandhu and B Praak',
      'image': 'https://picsum.photos/seed/104/400',
      'labelColor': '0xFFB5E853'
    },
    {
      'title': 'Kushagra Mix',
      'subtitle': 'Pritam, Guru Randhawa and Yo Yo Honey Singh',
      'image': 'https://picsum.photos/seed/105/400',
      'labelColor': '0xFFCB9EFF'
    },
    {
      'title': 'Pritam Mix',
      'subtitle': 'Kushagra Singh',
      'image': 'https://picsum.photos/seed/106/400',
      'labelColor': '0xFF90D5FF'
    },
  ];

  final List<Map<String, String>> startListening = [
    {
      'title': 'Tere Liye',
      'subtitle': 'Atif Aslam, Shreya Ghoshal, Sachin Gupta, S...',
      'image': 'https://picsum.photos/seed/201/100'
    },
    {
      'title': 'Mann Mera',
      'subtitle': 'Gajendra Verma',
      'image': 'https://picsum.photos/seed/202/100'
    },
    {
      'title': 'Fakira',
      'subtitle': 'Vishal-Shekhar, Sanam Puri, Neeti Mohan',
      'image': 'https://picsum.photos/seed/203/100'
    },
  ];

  final List<Map<String, String>> popularArtists = [
    {'name': 'Yo Yo Honey Singh', 'image': 'https://picsum.photos/seed/301/400'},
    {'name': 'Arijit Singh', 'image': 'https://picsum.photos/seed/302/400'},
    {'name': 'Pritam', 'image': 'https://picsum.photos/seed/303/400'},
    {'name': 'Guru Randhawa', 'image': 'https://picsum.photos/seed/304/400'},
  ];

  final List<Map<String, String>> moreLikeArtist = [
    {
      'title': 'Bollywood & Chill',
      'subtitle': 'Playlist • Pritam, Sachin-Jigar, Atif...',
      'image': 'https://picsum.photos/seed/401/400'
    },
    {
      'title': 'Happy Vibes',
      'subtitle': 'Playlist • Pritam, Sachin-Jigar, Suni...',
      'image': 'https://picsum.photos/seed/402/400'
    },
    {
      'title': 'Pritam Hits',
      'subtitle': 'Playlist • Kushagra Singh',
      'image': 'https://picsum.photos/seed/403/400'
    },
  ];

  final List<Map<String, String>> sadSongs = [
    {
      'title': 'Sad Songs Hindi',
      'subtitle': 'Playlist',
      'image': 'https://picsum.photos/seed/501/400'
    },
    {
      'title': 'Heartbreak Hits',
      'subtitle': 'Playlist',
      'image': 'https://picsum.photos/seed/502/400'
    },
    {
      'title': 'Emotional Vibes',
      'subtitle': 'Playlist',
      'image': 'https://picsum.photos/seed/503/400'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopFilterRow(),
            Expanded(
              child: Stack(
                children: [

                  // ── LAYER 1: Scrollable Content ──
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        SectionHeader(title: 'Recommended Stations'),
                        const SizedBox(height: 14),
                        _buildRadioCards(),
                        const SizedBox(height: 28),
                        SectionHeader(title: 'To get you started'),
                        const SizedBox(height: 14),
                        _buildToGetStartedCards(),
                        const SizedBox(height: 28),
                        _buildStartListeningSection(),
                        const SizedBox(height: 28),
                        SectionHeader(title: 'Popular artists'),
                        const SizedBox(height: 14),
                        _buildPopularArtists(),
                        const SizedBox(height: 28),
                        _buildMoreLikeSection(),
                        const SizedBox(height: 28),
                        SectionHeader(title: 'Sad songs'),
                        const SizedBox(height: 14),
                        SizedBox(
                          height: 210,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: sadSongs.length,
                            itemBuilder: (context, index) {
                              return AlbumCard(
                                title: sadSongs[index]['title']!,
                                subtitle: sadSongs[index]['subtitle'],
                                imageUrl: sadSongs[index]['image']!,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 200),
                      ],
                    ),
                  ),

                  // ── LAYER 2: Mini Player + Nav Bar (ON TOP) ──
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // Gradient fade
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x00121212),
                                Color(0xCC121212),
                              ],
                            ),
                          ),
                        ),

                        // ✅ FIXED Mini Player — solid background
                        _buildMiniPlayer(),

                        // Transparent Nav Bar (only affects itself)
                        Container(
                          color: const Color(0xFF121212).withOpacity(0.88),
                          child: _buildBottomNavBar(),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────
  // TOP FILTER ROW
  // ─────────────────────────────────────────────────
  Widget _buildTopFilterRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFF121212),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF4285F4),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'I',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _buildFilterChip('All', isActive: _activeFilter == 'All'),
          const SizedBox(width: 6),
          _buildFilterChip('Music', isActive: _activeFilter == 'Music'),
          const SizedBox(width: 6),
          _buildFilterChip('Podcasts', isActive: _activeFilter == 'Podcasts'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {required bool isActive}) {
    return GestureDetector(
      onTap: () => setState(() => _activeFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF1DB954) : const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────
  // RADIO CARDS
  // ─────────────────────────────────────────────────
  Widget _buildRadioCards() {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: recommendedStations.length,
        itemBuilder: (context, index) {
          final Color bgColor = Color(
            int.parse(recommendedStations[index]['color']!),
          );
          return Container(
            width: 175,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.music_note, color: Colors.black54, size: 18),
                      Text(
                        'RADIO',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: 60,
                    child: Stack(
                      children: [
                        _overlappingCircle(
                          'https://picsum.photos/seed/${index * 10 + 1}/100', 0),
                        _overlappingCircle(
                          'https://picsum.photos/seed/${index * 10 + 2}/100', 35),
                        _overlappingCircle(
                          'https://picsum.photos/seed/${index * 10 + 3}/100', 70),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    recommendedStations[index]['title']!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _overlappingCircle(String imageUrl, double left) {
    return Positioned(
      left: left,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────
  // TO GET YOU STARTED
  // ─────────────────────────────────────────────────
  Widget _buildToGetStartedCards() {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: toGetYouStarted.length,
        itemBuilder: (context, index) {
          final Color labelColor = Color(
            int.parse(toGetYouStarted[index]['labelColor']!),
          );
          return Container(
            width: 180,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        toGetYouStarted[index]['image']!,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 180,
                            height: 180,
                            color: const Color(0xFF333333),
                            child: const Icon(Icons.music_note,
                                color: Colors.grey, size: 40),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: labelColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          toGetYouStarted[index]['title']!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  toGetYouStarted[index]['subtitle']!,
                  style: TextStyle(color: Colors.grey[400], fontSize: 11),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ─────────────────────────────────────────────────
  // START LISTENING
  // ─────────────────────────────────────────────────
  Widget _buildStartListeningSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jump into a session based on your tastes',
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
              const SizedBox(height: 4),
              const Text(
                'Start listening',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        ...startListening.map((song) => SongListTile(
          title: song['title']!,
          subtitle: song['subtitle']!,
          imageUrl: song['image']!,
        )),
      ],
    );
  }

  // ─────────────────────────────────────────────────
  // POPULAR ARTISTS
  // ─────────────────────────────────────────────────
  Widget _buildPopularArtists() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: popularArtists.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundImage:
                      NetworkImage(popularArtists[index]['image']!),
                ),
                const SizedBox(height: 8),
                Text(
                  popularArtists[index]['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ─────────────────────────────────────────────────
  // MORE LIKE ARTIST
  // ─────────────────────────────────────────────────
  Widget _buildMoreLikeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage:
                    NetworkImage('https://picsum.photos/seed/303/200'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'More like',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                  const Text(
                    'Pritam',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: moreLikeArtist.length,
            itemBuilder: (context, index) {
              return AlbumCard(
                title: moreLikeArtist[index]['title']!,
                subtitle: moreLikeArtist[index]['subtitle'],
                imageUrl: moreLikeArtist[index]['image']!,
              );
            },
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────
  // MINI PLAYER  ← THE FIXED METHOD
  // ─────────────────────────────────────────────────
  Widget _buildMiniPlayer() {
    return Container(
      height: 64,
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1,
        ),
        // ✅ KEY FIX: Solid colors — no .withOpacity() on gradient stops.
        // Previously these had .withOpacity(0.95) which made the
        // mini player semi-transparent, showing content beneath.
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF1F4A30), // ✅ solid
            Color(0xFF1A3D28), // ✅ solid
          ],
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              'https://picsum.photos/seed/10/100',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 44,
                  height: 44,
                  color: const Color(0xFF333333),
                  child: const Icon(Icons.music_note,
                      color: Colors.grey, size: 20),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Finding Her',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Kushagra',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.devices,
              color: Colors.white.withOpacity(0.9), size: 22),
          const SizedBox(width: 16),
          Icon(Icons.add_circle_outline,
              color: Colors.white.withOpacity(0.9), size: 22),
          const SizedBox(width: 16),
          const Icon(Icons.play_arrow, color: Colors.white, size: 32),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────
  // BOTTOM NAV BAR
  // ─────────────────────────────────────────────────
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      type: BottomNavigationBarType.fixed,
      currentIndex: _activeNavIndex,
      elevation: 0,
      onTap: (index) => setState(() => _activeNavIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, size: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 24),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music_outlined, size: 24),
          label: 'Your Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.workspace_premium_outlined, size: 24),
          label: 'Premium',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline, size: 24),
          label: 'Create',
        ),
      ],
    );
  }
}