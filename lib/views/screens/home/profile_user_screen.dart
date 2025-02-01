import 'package:flutter/material.dart';

/*
PANTALLA: ajustes de la app
*/
class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileUserScreen'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
