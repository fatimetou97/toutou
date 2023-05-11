import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: Image.asset(
                'images/mauri.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
                'Avec mauriUrgence votre vie est  plus proche \n de la securite, Il vous suffit de nous  informer \n pour prendre les mesures nécessaires'),
          ],
        ),
      ),
    );
  }
}
