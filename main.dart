import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F172A)),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF475569),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Container(
              color: const Color(0xFFF8FAFC),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTopBar(context),
                  const SizedBox(height: 24),
                  _buildProfileHeader(),
                  const SizedBox(height: 24),
                  _buildStatsCard(),
                  const SizedBox(height: 24),
                  _buildAboutMeSection(),
                  const SizedBox(height: 24),
                  _buildSkillsSection(),
                  const SizedBox(height: 24),
                  _buildFeaturedProjectsSection(),
                  const SizedBox(height: 24),
                  _buildContactSection(),
                ],
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }

  /// 1. TopBar (Row: MainAxisAlignment.spaceBetween | Height: 42)
  Widget _buildTopBar(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSquareButton(
            icon: Icons.chevron_left_rounded,
            iconSize: 22,
            onTap: () {},
          ),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          _buildSquareButton(
            icon: Icons.share_outlined,
            iconSize: 18,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton({
    required IconData icon,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        ),
        child: Center(
          child: Icon(icon, size: iconSize, color: const Color(0xFF0F172A)),
        ),
      ),
    );
  }

  /// 2. Profile Header (Avatar: 140x140 | CircleAvatar from images/ | Name | Role | Location)
  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Outer Gradient Ring (140x140)
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFB088),
                    Color(0xFFFF8080),
                    Color(0xFFFFCF71),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 132,
                height: 132,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                // CircleAvatar taking image from images/
                child: const CircleAvatar(
                  radius: 62,
                  backgroundColor: Color(0xFFE2E8F0),
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
              ),
            ),
            // Verified Badge (28x28 at bottom-right)
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0284C7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Alex Rivers',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Lead Mobile Engineer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Color(0xFF64748B),
              ),
              SizedBox(width: 6),
              Text(
                'Tokyo, Japan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 3. Stats Card (Container: Radius 20 | Height: 78 | BoxShadow 0 8 18)
  Widget _buildStatsCard() {
    return Container(
      constraints: const BoxConstraints(minHeight: 78),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D0F1729),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: _buildStatItem('148', 'Projects')),
          _buildStatDivider(),
          Expanded(child: _buildStatItem('9 Yrs', 'Experience')),
          _buildStatDivider(),
          Expanded(child: _buildStatItem('4.9 ★', 'Rating', isRating: true)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, {bool isRating = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color:
                  isRating ? const Color(0xFFEAB308) : const Color(0xFF0F172A),
            ),
          ),
        ),
        const SizedBox(height: 3),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 28,
      color: const Color(0xFFE2E8F0),
    );
  }

  /// 4. About Me (Column | Height: 90 | Gap: 8)
  Widget _buildAboutMeSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant architecture, intuitive UX, and design systems.',
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: Color(0xFF475569),
          ),
        ),
      ],
    );
  }

  /// 5. Skills & Expertise (Column > Chips | Gap: 10)
  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills & Expertise',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _SkillBadge(
              label: 'Flutter',
              icon: Icons.flutter_dash,
              bgColor: Color(0xFFE0F2FE),
              fgColor: Color(0xFF0369A1),
            ),
            _SkillBadge(
              label: 'Dart',
              icon: Icons.code_rounded,
              bgColor: Color(0xFFDCFCE7),
              fgColor: Color(0xFF15803D),
            ),
            _SkillBadge(
              label: 'Clean Arch',
              icon: Icons.layers_outlined,
              bgColor: Color(0xFFFFE4E6),
              fgColor: Color(0xFFBE123C),
            ),
            _SkillBadge(
              label: 'UI/UX',
              icon: Icons.palette_outlined,
              bgColor: Color(0xFFF3E8FF),
              fgColor: Color(0xFF7E22CE),
            ),
            _SkillBadge(
              label: 'Firebase',
              icon: Icons.local_fire_department_rounded,
              bgColor: Color(0xFFFEF3C7),
              fgColor: Color(0xFFB45309),
            ),
          ],
        ),
      ],
    );
  }

  /// 6. Featured Projects (2 Cards: 165x145 | Gap: 12)
  Widget _buildFeaturedProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Projects',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
              child: _ProjectCard(
                imagePath: 'images/project_eshop.png',
                title: 'E-Shop Flutter',
                subtitle: 'Mobile App • 2026',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _ProjectCard(
                imagePath: 'images/project_crypto.png',
                title: 'Crypto Vault',
                subtitle: 'Finance • Clean Arch',
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 7. Contact Card (Radius: 20 | 3 Rows | BoxShadow 0 4 12)
  Widget _buildContactSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F1729),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          _ContactItem(
            icon: Icons.alternate_email_rounded,
            iconColor: Color(0xFF0F172A),
            iconBoxBg: Color(0xFFF1F5F9),
            title: 'Contact Information',
            titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
          _ContactItem(
            icon: Icons.mail_outline_rounded,
            iconColor: Color(0xFF475569),
            iconBoxBg: Color(0xFFF8FAFC),
            title: 'alex.rivers@email.com',
            titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155),
            ),
          ),
          Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
          _ContactItem(
            icon: Icons.phone_outlined,
            iconColor: Color(0xFF475569),
            iconBoxBg: Color(0xFFF8FAFC),
            title: '+81 (90) 1234-5678',
            titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color fgColor;

  const _SkillBadge({
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: fgColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const _ProjectCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F1729),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: SizedBox(
              height: 85,
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE2E8F0),
                  child: const Center(
                    child: Icon(Icons.image_outlined, color: Color(0xFF94A3B8)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBoxBg;
  final String title;
  final TextStyle titleStyle;

  const _ContactItem({
    required this.icon,
    required this.iconColor,
    required this.iconBoxBg,
    required this.title,
    required this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: iconBoxBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(icon, size: 18, color: iconColor),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: Color(0xFFCBD5E1),
            ),
          ],
        ),
        ),
    );
  }
}
