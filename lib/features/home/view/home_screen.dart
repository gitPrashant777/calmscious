import 'package:flutter/material.dart';
import 'package:calmscious/core/router/app_routes.dart';
import 'package:calmscious/core/constants/app_colors.dart';
import 'package:calmscious/core/widgets/course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.spa, color: AppColors.primary, size: 28), // mock logo
            const SizedBox(width: 8),
            const Text(
              'Calmscious',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.primaryLight,
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&q=80'), // user mock
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good Afternoon,', style: TextStyle(fontSize: 14, color: AppColors.textPrimary)),
                          Text('Arsh!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: AppColors.textPrimary),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.white,
                      padding: const EdgeInsets.all(12),
                    ),
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.notifications),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Mood tracker
              const Text(
                'How are you feeling today ?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _MoodBox(icon: Icons.sentiment_satisfied_alt, label: 'Happy', color: Colors.amber),
                    _MoodBox(icon: Icons.sentiment_neutral, label: 'Calm', color: AppColors.primary),
                    _MoodBox(icon: Icons.sentiment_very_dissatisfied, label: 'Crying', color: Colors.blueAccent),
                    _MoodBox(icon: Icons.mood_bad, label: 'Angry', color: Colors.redAccent),
                    _MoodBox(icon: Icons.sick_outlined, label: 'Anxious', color: Colors.deepOrange),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 1 on 1 Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF8C2AE), Color(0xFFE29578)], // Matching the Figma layout exact RGBA
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000), // rgba 0 0 0 0.25 equivalent -> roughly 40 hex alpha
                      blurRadius: 9,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1 on 1 Sessions',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lets open up to the things that\nmatter the most',
                      style: TextStyle(fontSize: 14, color: AppColors.white, height: 1.4),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Text('Book Now', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white)),
                        SizedBox(width: 6),
                        Icon(Icons.calendar_today, color: AppColors.white, size: 16),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Popular on Calmicious
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular on Calmicious', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.allCourses),
                    child: const Text('See All', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CourseCard(
                      title: 'Sit With Yourself',
                      subtitle: 'A gentle introduction to stillness',
                      imageUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?auto=format&fit=crop&w=400&q=80',
                      isLocked: true,
                      onTap: () => Navigator.pushNamed(context, AppRoutes.courseDetail),
                      width: 220,
                    ),
                    const SizedBox(width: 16),
                    CourseCard(
                      title: 'One Breath at a Time',
                      subtitle: 'Finding focus through breath',
                      imageUrl: 'https://images.unsplash.com/photo-1518241355403-f1110a12e3e7?auto=format&fit=crop&w=400&q=80',
                      isLocked: true,
                      onTap: () => Navigator.pushNamed(context, AppRoutes.courseDetail),
                      width: 220,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // Live sessions
              const Text('Live sessions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CourseCard(
                      title: 'Sit With Yourself',
                      subtitle: 'A gentle introduction to stillness',
                      imageUrl: 'https://images.unsplash.com/photo-1599901860904-17e08c2d4dc9?auto=format&fit=crop&w=400&q=80',
                      isLive: true,
                      onTap: () => Navigator.pushNamed(context, AppRoutes.courseDetail),
                      width: 220,
                    ),
                    const SizedBox(width: 16),
                    CourseCard(
                      title: 'One Breath at a Time',
                      subtitle: 'Finding focus through breath',
                      imageUrl: 'https://images.unsplash.com/photo-1448375240586-882707db888b?auto=format&fit=crop&w=400&q=80',
                      onTap: () => Navigator.pushNamed(context, AppRoutes.courseDetail),
                      width: 220,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // Calming music
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Calming music', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.allCourses),
                    child: const Text('See All', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CourseCard(
                      title: 'Sound Of OM',
                      subtitle: 'A gentle introduction to stillness',
                      imageUrl: 'https://images.unsplash.com/photo-1518288774672-b94e808873ff?auto=format&fit=crop&w=400&q=80',
                      onTap: () {},
                      width: 220,
                    ),
                    const SizedBox(width: 16),
                    CourseCard(
                      title: 'Flowing Water',
                      subtitle: 'Finding focus through breath',
                      imageUrl: 'https://images.unsplash.com/photo-1437482078695-73f5ca6c96e2?auto=format&fit=crop&w=400&q=80',
                      onTap: () {},
                      width: 220,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoodBox extends StatelessWidget {
  const _MoodBox({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(color: AppColors.cardShadow, blurRadius: 6, offset: Offset(0, 3)),
              ],
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textPrimary, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
