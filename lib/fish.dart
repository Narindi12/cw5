// lib/fish.dart
import 'dart:math';
import 'package:flutter/material.dart';

class Fish {
  Color color;
  double speed;
  Offset position;
  double directionX;
  double directionY;

  Fish({
    required this.color,
    required this.speed,
    Offset? position,
  })  : this.position = position ?? const Offset(100, 100), // Initialize position with a default value
        this.directionX = Random().nextDouble() * 2 - 1, // Randomize direction
        this.directionY = Random().nextDouble() * 2 - 1; // Randomize direction

  void move() {
    // Update position based on speed and direction
    position = Offset(
      position.dx + directionX * speed,
      position.dy + directionY * speed,
    );

    // Bounce off the edges
    if (position.dx < 0 || position.dx > 280) {
      directionX *= -1;
    }
    if (position.dy < 0 || position.dy > 280) {
      directionY *= -1;
    }
  }

  Widget buildFish() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
