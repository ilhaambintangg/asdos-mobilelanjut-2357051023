
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(
                tag: 'rocket-animation',
                child: Icon(
                  Icons.rocket_launch,
                  size: 100,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Selamat Datang di Halaman Detail!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Ikon roket berpindah dari halaman utama '
                'menggunakan Hero Animation.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}