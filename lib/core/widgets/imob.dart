import 'package:flutter/material.dart';

class Imob extends StatelessWidget {
  const Imob({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 25,
      width: 30,
decoration: const BoxDecoration(
  image: DecorationImage( fit: BoxFit.fill,image: AssetImage('assets/images/889199.png'))
),

    );
  }
}