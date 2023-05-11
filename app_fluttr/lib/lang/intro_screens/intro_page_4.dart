import 'package:flutter/material.dart';

class IntroPage4 extends StatelessWidget {
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
                'images/ambulance.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
                'Une équipe de secours médical équipée des derniers\n outils médicaux, avec une voiture médicale qui\n vous atteindra où que vous soyez'),
          ],
        ),
      ),
    );
  }
}
