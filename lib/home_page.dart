
import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  late final AnimationController _controller;
  late final Animation<double> _heartAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _heartAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openDetail() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const DetailPage();
        },
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion =
        MediaQuery.of(context).disableAnimations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations & Transitions'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Praktikum Animasi Flutter',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Coba ketuk kotak, perhatikan animasi hati, '
            'dan buka halaman Detail melalui ikon roket.',
          ),
          const SizedBox(height: 24),

          // 1. Implicit Animation
          const Text(
            '1. Implicit Animation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Center(
            child: Semantics(
              button: true,
              label: 'Kotak animasi. Ketuk untuk mengubah ukuran.',
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(
                    milliseconds: reduceMotion ? 0 : 400,
                  ),
                  curve: Curves.easeInOut,
                  width: _expanded ? 240 : 150,
                  height: _expanded ? 150 : 100,
                  decoration: BoxDecoration(
                    color: _expanded
                        ? Colors.deepPurple
                        : Colors.indigo,
                    borderRadius: BorderRadius.circular(
                      _expanded ? 30 : 12,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Ketuk Saya',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // 2. Explicit Animation
          const Text(
            '2. Explicit Animation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: AnimatedBuilder(
              animation: _heartAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: reduceMotion
                      ? 1.0
                      : _heartAnimation.value,
                  child: child,
                );
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 70,
                semanticLabel: 'Ikon hati',
              ),
            ),
          ),

          const SizedBox(height: 12),
          const Center(
            child: Text('Animasi hati berdenyut'),
          ),

          const SizedBox(height: 32),

          // 3. Hero Animation dan Page Transition
          const Text(
            '3. Hero Animation & Page Transition',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: IconButton(
              tooltip: 'Buka halaman Detail',
              onPressed: _openDetail,
              iconSize: 64,
              icon: const Hero(
                tag: 'rocket-animation',
                child: Icon(
                  Icons.rocket_launch,
                  color: Colors.deepPurple,
                  size: 64,
                ),
              ),
            ),
          ),

          const Center(
            child: Text('Ketuk roket untuk membuka Detail'),
          ),
        ],
      ),
    );
  }
}
