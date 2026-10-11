import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AssetsMediaPage extends StatefulWidget {
  const AssetsMediaPage({super.key});

  @override
  State<AssetsMediaPage> createState() => _AssetsMediaPageState();
}

class _AssetsMediaPageState extends State<AssetsMediaPage> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  void playAudio() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(
        AssetSource('audios/music.mp3'),
      );
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      appBar: AppBar(
        title: const Text('Assets & Media'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profile.jpeg',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 15),
                  const Text(
                    'Muhammad Ilham Bintang F. E',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Audio Motivasi',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE7E0FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      onPressed: playAudio,
                      icon: Icon(
                        isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: LinearProgressIndicator(
                      value: 0.3,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Icon(Icons.volume_up),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}