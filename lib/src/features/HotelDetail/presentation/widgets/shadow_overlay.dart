import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowOverlay extends StatelessWidget {
  const ShadowOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 337,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.5)])),
      child: Row(
        children: [],
      ),
    );
  }
}
