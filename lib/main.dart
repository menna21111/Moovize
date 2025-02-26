import 'package:flutter/material.dart';

import 'features/splach/splash_screan.dart';

void main() {
  runApp(const Moovize());
}

class Moovize extends StatelessWidget {
  const Moovize({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splachscreanview(),
    );
  }
}
