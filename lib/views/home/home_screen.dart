import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/constants.dart';
import '../../widgets/item_card.dart';
import '../../providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFA),
      appBar: _buildTopBar(),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            // 1. Search & Filter Bar
            _buildSearchBar(),
            const SizedBox(height: 24),

            // 2. Categories Section (Move this anywhere in the list to change its position)
            _buildCategoriesSection(),
            const SizedBox(height: 28),

            // 3. Recommended Feed Header
            _buildRecommendedHeader(),
            const SizedBox(height: 14),

            // 4. Recommended Items List
            ItemCard(
              imageUrl: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?q=80&w=1000&auto=format&fit=crop',
              title: 'Stainless Steel French Press',
              location: 'West End • 1.5 km away',
              badgeText: 'Like New',
              priceTag: 'Free',
              onRequest: () {},
            ),
            const SizedBox(height: 16),
            ItemCard(
              imageUrl: 'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=1000&auto=format&fit=crop',
              title: 'Minimalist 3-Tier Plant Shelf',
              location: 'Havelock Town • 2.8 km away',
              badgeText: 'Good Condition',
              priceTag: 'Free',
              onRequest: () {},
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildTopBar() {
    return AppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF075B3A).withValues(alpha: 0.1)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF053321).withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/app_logo.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.brandPrimary,
                    child: const Icon(Icons.eco, color: Colors.white, size: 22),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'EcoLankan',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F2D21),
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xFFDCFCE7),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: const Text(
                        'BETA',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF075B3A),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: Color(0xFF075B3A)),
                    const SizedBox(width: 2),
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                        return Flexible(
                          child: Text(
                            '${userProvider.district}, Sri Lanka',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Stack(
            children: [
              const Icon(Icons.notifications_outlined, color: Colors.black87),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for items, categories...',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune, size: 18, color: Color(0xFF075B3A)),
                  onPressed: () {},
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    final categories = [
      {'name': 'Books', 'icon': Icons.menu_book_rounded},
      {'name': 'School', 'icon': Icons.school_outlined},
      {'name': 'Clothes', 'icon': Icons.checkroom_rounded},
      {'name': 'Shoes', 'icon': Icons.shopping_bag_outlined},
      {'name': 'Electronics', 'icon': Icons.devices_outlined},
      {'name': 'Household', 'icon': Icons.home_outlined},
      {'name': 'Other', 'icon': Icons.category_outlined},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Categories', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            Text('View All >', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF075B3A))),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 85,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final cat = categories[index];
              return _buildCategoryButton(cat['name'] as String, cat['icon'] as IconData);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButton(String label, IconData icon) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 6, offset: const Offset(0, 2))],
          ),
          child: Icon(icon, color: const Color(0xFF075B3A), size: 24),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87)),
      ],
    );
  }

  Widget _buildRecommendedHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Recommended for you', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            Text('Free sustainable giveaways near you', style: TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFDCFCE7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('Near you', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF075B3A))),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_rounded, 'Home'),
          _buildNavItem(1, Icons.search_rounded, 'Explore'),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Color(0xFF075B3A), Color(0xFF2ECC71)]),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 26),
            ),
          ),
          _buildNavItem(3, Icons.list_alt_rounded, 'Requests'),
          _buildNavItem(4, Icons.person_outline_rounded, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF075B3A) : Colors.grey,
            size: 22,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? const Color(0xFF075B3A) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}