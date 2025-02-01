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
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.amber,
          ),
          SizedBox(height: size.height * .03),
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          SizedBox(height: size.height * .03),
          Container(
            height: 200,
            width: 200,
            color: Colors.amber,
          ),
          SizedBox(height: size.height * .03),
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
