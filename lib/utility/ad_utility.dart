import 'dart:math'; 

import 'package:flutter/material.dart';

Container advertisement() {
  final List<String> adImages = [
    'assets/images/ad1.png',
    'assets/images/ad2.png',
    'assets/images/ad3.png',
    'assets/images/ad4.png',
    'assets/images/ad5.png',
    'assets/images/ad6.png',
  ];


  final Random random = Random();
  final int randomIndex = random.nextInt(adImages.length);

  return Container(
    color: Colors.amber,
    height: 80,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 104, 73, 73),
          width: 3.0,
        ),
      ),
      child: Image.asset(
        adImages[randomIndex],
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    ),
  );
}
